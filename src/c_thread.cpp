#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/c_console.hpp"
#include "../h/c_thread.hpp"
#include "../h/c_sleep.hpp"

int TCB::ID = 0;
TCB *TCB::running = nullptr;
time_t TCB::timer_counter = 0;
typedef TCB *thread_t;
extern thread_t handle_bleya;

TCB::TCB(run_t start_routine, void *arg, void *stack, Context context) :
        t_id(TCB::ID++), _run(start_routine), arg(arg),
        stack(stack), parent(TCB::running),
        context(context), status(RUNNABLE),
        time_slice(DEFAULT_TIME_SLICE), preempted(false), joiner() {
    this->joiner.init();
    if (TCB::running) {

    }
}

TCB::TCB(TCB &parent) :
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
        parent(&parent), context(parent.context), status(RUNNABLE), time_slice(DEFAULT_TIME_SLICE),
        preempted(false), joiner() {
    this->joiner.init();
}

int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    if (start_routine) Scheduler::put(*handle);
    return (*handle)->t_id;
}

void TCB::yield() {
    thread_t old = TCB::running;
    old->context.sstatus = Riscv::r_sstatus();
    old->context.sepc = Riscv::r_sepc();
    if (old->is_runnable() && old != handle_bleya) {
        Scheduler::put(old);
    } else if (old->is_finished()) {
        Allocator::_mem_free(old->stack);
    }
    if (Scheduler::is_empty()) {
        TCB::running = handle_bleya;
    } else {
        while (Scheduler::peek()->is_finished()) {
            Allocator::_mem_free(TCB::destroy_thread(Scheduler::get())->stack);
        }
        TCB::running = Scheduler::get();
    }
    Riscv::w_sstatus(TCB::running->context.sstatus);
    Riscv::w_sepc(TCB::running->context.sepc);
    TCB::context_switch(&old->context, &TCB::running->context);
}

void TCB::_thread_dispatch() {
    Riscv::push();
    TCB::yield();
    Riscv::pop();
}

TCB *TCB::destroy_thread(TCB *thread) {
    while (!thread->joiner.is_empty()) {
        TCB *next = thread->joiner.get();
        if (next->is_joined()) {
            next->run();
            Scheduler::put(next);
        }
    }
    thread->joiner.destroy();
    return thread;
}

void TCB::_thread_exit() {
    TCB::running->finish();
    TCB::destroy_thread(TCB::running);
    TCB::_thread_dispatch();
}

void TCB::_thread_join(thread_t handle) {
    if (handle->is_finished())
        return;
    TCB::running->enjoin();
    handle->joiner.put(TCB::running);
    TCB::_thread_dispatch();
}

void TCB::_thread_join(thread_t handle, time_t time) {
    if (handle->is_finished())
        return;
    TCB::running->enjoin();
    handle->joiner.put(TCB::running);
    Cradle::insert(TCB::running, time);
    TCB::_thread_dispatch();
}

void TCB::duplicate(TCB *parent, TCB *child) {
    Riscv::push();
    memcpy(parent->stack, child->stack, DEFAULT_STACK_SIZE);
    child->context = parent->context;
    Riscv::pop();
}

int TCB::_fork() {
    int id_parent = TCB::running->t_id;
    TCB *handle = new TCB(*TCB::running);
    TCB::duplicate(TCB::running, handle);
    print(TCB::running->t_id);
    putc(' ');
    print(id_parent);
    putc(' ');
    print(handle->t_id);
    putc('\n');
    if (TCB::running->t_id == id_parent) {
        Scheduler::put(handle);
        return handle->t_id;
    } else {
        print(TCB::running->t_id);
        return 0;
    }
}

int TCB::_kill(TCB* thread) {
    if (!thread) return -1;
    if (thread->is_finished()) return -2;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    Riscv::popSppSpie();
    TCB::running->_run(TCB::running->arg);
    thread_exit();
}