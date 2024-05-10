#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP

#include "../lib/hw.h"

enum InterruptCode {
    MEM_ALLOC = 0x1,
    MEM_FREE = 0x2,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    THREAD_JOIN = 0x14,
    THREAD_JOIN_TIME = 0x15,
    THREAD_FORK = 0x16,
    THREAD_KILL = 0x17,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    SIGNAL_WAIT = 0x25,
    TIME_SLEEP = 0x31,
    THREAD_WAKE = 0x32,
    GETC = 0x41,
    PUTC = 0x42
};


//allocates size bytes of memory
void *mem_alloc(size_t size); //0x01

//deallocates previously allocated memory
int mem_free(void *mem); //0x02

class TCB;

typedef TCB *thread_t;

//creates thread over start_routine with argument arg
int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg); //0x11

//finishes the current thread
int thread_exit();  //0x12

//relinquishes the CPU to the next thread
void thread_dispatch(); //0x13

//waits for the thread to finish
void thread_join(thread_t handle); //0x14

//waits for the thread to finish or for time to pass
void thread_join(thread_t handle, time_t time); //0x15

__attribute__ ((unused))
int fork(); //0x16 NOT WORKING AS OF YET

//kills the thread if it is a child of the calling thread
int thread_kill(thread_t handle);

class Sem;

typedef Sem _sem;

typedef _sem *sem_t;
typedef unsigned long time_t;

//allocates a semaphore
int sem_open(sem_t *handle, unsigned init); //0x21

//deallocates a semaphore
int sem_close(sem_t id); //0x22

//waits on the semaphore
int sem_wait(sem_t id); //0x23

//signals the semaphore
int sem_signal(sem_t id); //0x24

//atomically signals the semaphore and waits on another
int signal_and_wait(sem_t signal, sem_t wait); //0x25

//sleeps for ms deciseconds
int time_sleep(time_t ms); //0x31

//wakes another sleeping thread up
int thread_wake(thread_t handle); //0x32

const int EOF = -1;

//gets a character from the input
char getc(); //0x41

//prints a character to the output
void putc(char c); //0x42

uint64 scs();

void syscall(uint64, uint64 = 0, uint64 = 0, uint64 = 0, uint64 = 0);

#endif