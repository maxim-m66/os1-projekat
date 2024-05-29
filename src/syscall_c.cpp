#include "../h/syscall_c.hpp"


uint64 syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    uint64 volatile ret;
    __asm__ volatile("ecall");
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    return (void *) syscall(MEM_ALLOC, size);
}

int mem_free(void *mem) {
    return (int) syscall(MEM_FREE, (uint64) mem);
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack_space = nullptr;
    if (start_routine) {
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    }
    return (int) syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
}

int thread_exit() {
    return (int) syscall(THREAD_EXIT);
}

void thread_dispatch() {
    (void) syscall(THREAD_DISPATCH);
}

void thread_join(thread_t handle) {
    (void) syscall(THREAD_JOIN, (uint64) handle);
}

void thread_join(thread_t handle, time_t time) {
    if (time == 0) thread_join(handle);
    (void) syscall(THREAD_JOIN_TIME, (uint64) handle, time);
}

int fork() {
    return (int) syscall(THREAD_FORK);
}

int thread_kill(thread_t handle) {
    return (int) syscall(THREAD_KILL, (uint64) handle);
}

int sem_open(sem_t *handle, unsigned init) {
    return (int) syscall(SEM_OPEN, (uint64) handle, init);
}

int sem_close(sem_t id) {
    return (int) syscall(SEM_CLOSE, (uint64) id);
}

int sem_wait(sem_t id) {
    return (int) syscall(SEM_WAIT, (uint64) id);
}

int sem_signal(sem_t id) {
    return (int) syscall(SEM_SIGNAL, (uint64) id);
}

int sem_signal_all(sem_t id) {
    return (int) syscall(SIGNAL_ALL, (uint64) id);
}

int signal_and_wait(sem_t signal, sem_t wait) {
    return (int) syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
}

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    return (int) syscall(TIME_SLEEP, ms);
}

int thread_wake(thread_t handle) {
    return (int) syscall(THREAD_WAKE, (uint64) handle);
}

char getc() {
    return (char) syscall(GETC);
}

void putc(char c) {
    syscall(PUTC, c);
}
