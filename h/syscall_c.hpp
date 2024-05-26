#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP

#include "../lib/hw.h"

enum InterruptCode {
    MEM_ALLOC,
    MEM_FREE,
    THREAD_CREATE,
    THREAD_EXIT,
    THREAD_DISPATCH,
    THREAD_JOIN,
    THREAD_JOIN_TIME,
    THREAD_FORK,
    THREAD_KILL,
    SEM_OPEN,
    SEM_CLOSE,
    SEM_WAIT,
    SEM_SIGNAL,
    SIGNAL_ALL,
    SIGNAL_WAIT,
    TIME_SLEEP,
    THREAD_WAKE,
    GETC,
    PUTC,
    SYSCALL_COUNT
};


//allocates size bytes of memory
void *mem_alloc(size_t size);

//deallocates previously allocated memory
int mem_free(void *mem);

class TCB;

typedef TCB *thread_t;

//creates thread over start_routine with argument arg
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg);

//finishes the current thread
int thread_exit();

//relinquishes the CPU to the next thread
void thread_dispatch();

//waits for the thread to finish
void thread_join(thread_t handle);

//waits for the thread to finish or for time to pass
void thread_join(thread_t handle, time_t time);

__attribute__ ((unused))
int fork(); // NOT WORKING YET

//kills the thread if it is a child of the calling thread
int thread_kill(thread_t handle);

class Sem;

typedef Sem _sem;

typedef _sem *sem_t;
typedef unsigned long time_t;

//allocates a semaphore
int sem_open(sem_t *handle, unsigned init);

//deallocates a semaphore
int sem_close(sem_t id);

//waits on the semaphore
int sem_wait(sem_t id);

//signals the semaphore
int sem_signal(sem_t id);

int sem_signal_all(sem_t id);

//atomically signals the semaphore and waits on another
int signal_and_wait(sem_t signal, sem_t wait);

//sleeps for ms deciseconds
int time_sleep(time_t ms);

//wakes another sleeping thread up
int thread_wake(thread_t handle);

const int EOF = -1;

//gets a character from the input
char getc();

//prints a character to the output
void putc(char c);

uint64 scs();

void syscall(uint64, uint64 = 0, uint64 = 0, uint64 = 0, uint64 = 0);

#endif