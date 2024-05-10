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

void *mem_alloc(size_t size); //0x01

int mem_free(void *mem); //0x02

class TCB;

typedef TCB *thread_t;

int thread_create(thread_t *handle, void(*start_routine)(void *), void *arg); //0x11

int thread_exit();  //0x12

void thread_dispatch(); //0x13

void thread_join(thread_t handle); //0x14

void thread_join(thread_t handle, time_t time); //0x15

__attribute__ ((unused))
int fork(); //0x16 NOT WORKING AS OF YET

int thread_kill(thread_t handle);

class Sem;

typedef Sem _sem;

typedef _sem *sem_t;
typedef unsigned long time_t;

int sem_open(sem_t *handle, unsigned init); //0x21

int sem_close(sem_t id); //0x22

int sem_wait(sem_t id); //0x23

int sem_signal(sem_t id); //0x24

int signal_and_wait(sem_t signal, sem_t wait); //0x25

int time_sleep(time_t ms); //0x31

int thread_wake(thread_t handle); //0x32

const int EOF = -1;

char getc(); //0x41

void putc(char c); //0x42

bool is_user();

uint64 scs();

#endif