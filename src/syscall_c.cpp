#include "../h/syscall_c.hpp"
#include "../h/c_console.hpp"


void syscall(uint64 code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    __asm__ volatile("ecall");
}

void *mem_alloc(size_t size) {
    if (size == 0) return nullptr;
    void volatile *ret;
    syscall(MEM_ALLOC, size);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return (void *) ret;
}

int mem_free(void *mem) {
    int volatile ret;
    syscall(MEM_FREE, (uint64) mem);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg) {
    void *stack_space = nullptr;
    if (start_routine) {
        stack_space = mem_alloc(DEFAULT_STACK_SIZE);
    }
    int volatile ret;
    syscall(THREAD_CREATE, (uint64) handle, (uint64) start_routine, (uint64) arg, (uint64) stack_space);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int thread_exit() {
    int volatile ret;
    syscall(THREAD_EXIT);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

void thread_dispatch() {
    syscall(THREAD_DISPATCH);
}

void thread_join(thread_t handle) {
    syscall(THREAD_JOIN, (uint64) handle);
}

void thread_join(thread_t handle, time_t time) {
    if (time == 0) thread_join(handle);
    syscall(THREAD_JOIN_TIME, (uint64) handle, time);
}

int fork() {
    int volatile ret;
    syscall(THREAD_FORK);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int thread_kill(thread_t handle) {
    int volatile ret;
    syscall(THREAD_KILL, (uint64) handle);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int sem_open(sem_t *handle, unsigned init) {
    int volatile ret;
    syscall(SEM_OPEN, (uint64) handle, init);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int sem_close(sem_t id) {
    int volatile ret;
    syscall(SEM_CLOSE, (uint64) id);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int sem_wait(sem_t id) {
    int volatile ret;
    syscall(SEM_WAIT, (uint64) id);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int sem_signal(sem_t id) {
    int volatile ret;
    syscall(SEM_SIGNAL, (uint64) id);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int signal_and_wait(sem_t signal, sem_t wait) {
    int volatile ret;
    syscall(SIGNAL_WAIT, (uint64) signal, (uint64) wait);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int time_sleep(time_t ms) {
    if (ms == 0) return -1;
    int volatile ret;
    syscall(TIME_SLEEP, ms);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

int thread_wake(thread_t handle) {
    int volatile ret;
    syscall(TIME_SLEEP, (uint64) handle);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

char getc() {
    char volatile ret;
    syscall(GETC);
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}

void putc(char c) {
    syscall(PUTC, c);
}

uint64 scs() {
    int volatile ret;
    Riscv::r_stvec();
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r"(ret));
    return ret;
}
