#include "../lib/hw.h"
#include "../h/c_thread.hpp"
#include "../h/c_semaphore.hpp"
#include "../h/riscv.hpp"
#include "../h/c_console.hpp"
#include "../h/c_sleep.hpp"
#include "../h/scheduler.hpp"

bool tru() {
    return true;
}

uint64 rar() {
    return Riscv::r_scause();
}

__attribute__((unused))
void Riscv::handleSupervisorTrap() {
    uint64 code, arg1, arg2, arg3, arg4;
    __asm__ volatile("mv %[code], a0" : [code] "=r"(code));
    __asm__ volatile("mv %[arg1], a1" : [arg1] "=r"(arg1));
    __asm__ volatile("mv %[arg2], a2" : [arg2] "=r"(arg2));
    __asm__ volatile("mv %[arg3], a3" : [arg3] "=r"(arg3));
    __asm__ volatile("mv %[arg4], a4" : [arg4] "=r"(arg4));
    if (r_scause() == 2) {
        print("Illegal Instruction\n");
        TCB::_thread_exit();
    }
    switch (code) {
        case MEM_ALLOC:
            Allocator::_mem_alloc((int) arg1);
            break;
        case MEM_FREE:
            Allocator::_mem_free((void *) arg1);
            break;
        case THREAD_CREATE:
            TCB::_thread_create((thread_t *) arg1, (run_t) arg2, (void *) arg3, (void *) arg4);
            break;
        case THREAD_EXIT:
            TCB::_thread_exit();
            break;
        case THREAD_DISPATCH:
            TCB::_thread_dispatch();
            break;
        case THREAD_JOIN:
            TCB::_thread_join((thread_t) arg1);
            break;
        case THREAD_JOIN_TIME:
            TCB::_thread_join((thread_t) arg1, (time_t) arg2);
            break;
        case THREAD_FORK:
            TCB::_fork();
            break;
        case THREAD_KILL:
            TCB::_kill((thread_t) arg1);
            break;
        case SEM_OPEN:
            Sem::_sem_open((sem_t *) arg1, arg2);
            break;
        case SEM_CLOSE:
            Sem::_sem_close((sem_t) arg1);
            break;
        case SEM_WAIT:
            Sem::_sem_wait((sem_t) arg1);
            break;
        case SEM_SIGNAL:
            Sem::_sem_signal((sem_t) arg1);
            break;
        case SIGNAL_WAIT:
            Sem::_sem_signal((sem_t) arg1);
            Sem::_sem_wait((sem_t) arg2);
        case TIME_SLEEP:
            Cradle::_time_sleep((time_t) arg1);
            break;
        case THREAD_WAKE:
            Cradle::_thread_wake((thread_t) arg1);
        case GETC:
            IO::_getc();
            break;
        case PUTC:
            IO::_putc((char) arg1);
            break;
        default:
            break;
    }
}


__attribute__((unused))
void Riscv::handleTimerTrap() {
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
}

__attribute__((unused))
void Riscv::handleConsoleTrap() {
    if (plic_claim() == CONSOLE_IRQ) {
        while ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IO::Input.put(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
}

void Riscv::popSppSpie() {
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}


__attribute__((unused))
void Riscv::handleReadTrap() {
    *(volatile char *) CONSOLE_TX_DATA = '!';
    *(volatile char *) CONSOLE_TX_DATA = 'r';
}


__attribute__((unused))
void Riscv::handleWriteTrap() {
    *(volatile char *) CONSOLE_TX_DATA = '!';
    *(volatile char *) CONSOLE_TX_DATA = 'w';
}