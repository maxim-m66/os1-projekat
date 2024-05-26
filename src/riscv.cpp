#include "../lib/hw.h"
#include "../h/c_thread.hpp"
#include "../h/c_semaphore.hpp"
#include "../h/riscv.hpp"
#include "../h/c_console.hpp"
#include "../h/c_sleep.hpp"
#include "../h/scheduler.hpp"

Riscv::syscall_f Riscv::syscall_table[SYSCALL_COUNT] = {
        reinterpret_cast<Riscv::syscall_f>(Allocator::_mem_alloc),
        reinterpret_cast<Riscv::syscall_f>(Allocator::_mem_free),
        reinterpret_cast<Riscv::syscall_f>(TCB::_thread_create),
        reinterpret_cast<Riscv::syscall_f>(TCB::_thread_exit),
        reinterpret_cast<Riscv::syscall_f>(TCB::_thread_dispatch),
        reinterpret_cast<Riscv::syscall_f>(TCB::_thread_join),
        reinterpret_cast<Riscv::syscall_f>(TCB::_thread_join_time),
        reinterpret_cast<Riscv::syscall_f>(TCB::_fork),
        reinterpret_cast<Riscv::syscall_f>(TCB::_kill),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_open),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_close),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_wait),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_signal),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_signal_all),
        reinterpret_cast<Riscv::syscall_f>(Sem::_sem_signal_wait),
        reinterpret_cast<Riscv::syscall_f>(Cradle::_time_sleep),
        reinterpret_cast<Riscv::syscall_f>(Cradle::_thread_wake),
        reinterpret_cast<Riscv::syscall_f>(IO::_getc),
        reinterpret_cast<Riscv::syscall_f>(IO::_putc)
};

void Riscv::handleSupervisorTrap(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    if (r_scause() == ILLEGAL_INSTRUCTION) {
        print("\nIllegal Instruction\n");
        TCB::_thread_exit();
    }
    syscall_table[code](arg1, arg2, arg3, arg4);
    w_sepc(sepc + 4);
    w_sstatus(sstatus);
}


void Riscv::handleTimerTrap() {
    uint64 sstatus = r_sstatus();
    uint64 sepc = r_sepc();
    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IO::Output.is_empty()) {
        char c = IO::Output.get();
        *(volatile char *) CONSOLE_TX_DATA = c;
    }
    mc_sip(SIP_SSIE);
    Cradle::update();
    while (!Cradle::is_empty() && Cradle::peak() == 0) {
        thread_t next = Cradle::remove();
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
    TCB::timer_counter++;
    if ((time_t) TCB::timer_counter >= TCB::running->get_time_slice() && !Scheduler::is_empty()) {
        TCB::timer_counter = 0;
        TCB::running->set_preempted();
        TCB::_thread_dispatch();
    }
    w_sepc(sepc);
    w_sstatus(sstatus);
}

void Riscv::handleConsoleTrap() {
    uint64 sepc = r_sepc();
    uint64 sstatuc = r_sstatus();
    if (plic_claim() == CONSOLE_IRQ) {
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IO::Input.put(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
    w_sepc(sepc);
    w_sstatus(sstatuc);
}

void Riscv::popSppSpie() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}

void Riscv::handleReadTrap() {
    *(volatile char *) CONSOLE_TX_DATA = '!';
    *(volatile char *) CONSOLE_TX_DATA = 'r';
}

void Riscv::handleWriteTrap() {
    *(volatile char *) CONSOLE_TX_DATA = '!';
    *(volatile char *) CONSOLE_TX_DATA = 'w';
}