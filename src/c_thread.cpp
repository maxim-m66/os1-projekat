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
    this->parent = TCB::running;
}

TCB::TCB(TCB &parent) :
        t_id(TCB::ID++), _run(parent._run), arg(parent.arg),
        stack(Allocator::_mem_alloc(DEFAULT_STACK_SIZE)),
        parent(&parent), context(parent.context), status(RUNNABLE), time_slice(DEFAULT_TIME_SLICE),
        preempted(false), joiner() {
    this->joiner.init();
    Scheduler::put(this);
}

int TCB::_thread_create(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    *handle = new TCB(start_routine, arg, stack, {(uint64) thread_start, (uint64) stack + DEFAULT_STACK_SIZE - 1});
    if (start_routine) Scheduler::put(*handle);
    else TCB::running = *handle;
    return (*handle)->t_id;
}

void TCB::_thread_dispatch() {
    thread_t old = TCB::running;
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
    if (riscv::setjump()) {
        TCB::context_switch(&old->context, &TCB::running->context);
        riscv::longjump();
    }
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

void TCB::_thread_join_time(thread_t handle, time_t time) {
    if (handle->is_finished())
        return;
    TCB::running->enjoin();
    handle->joiner.put(TCB::running);
    Cradle::insert(TCB::running, time);
    TCB::_thread_dispatch();
}

int TCB::_fork() {

    TCB *child = new TCB(*TCB::running);
    int volatile parent_id = TCB::running->t_id;
    memcpy(TCB::running->stack, child->stack, DEFAULT_STACK_SIZE);
    context_inherit(&child->context);
    print_h((uint64)TCB::running);
    if (TCB::running->t_id == parent_id) {
        return child->t_id;
    } else {
        return 0;
    }
}

int TCB::_kill(TCB *thread) {
    if (!thread) return -1;
    if (thread->is_finished()) return -2;
    if (TCB::running != thread->parent) return -4;
    thread->finish();
    return 0;
}

void TCB::thread_start() {
    riscv::popSppSpie();
    TCB::running->_run(TCB::running->arg);
    thread_exit();
}