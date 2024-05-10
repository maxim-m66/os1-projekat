#ifndef _syscall_cpp
#define _syscall_cpp

#include "../lib/hw.h"
#include "syscall_c.hpp"

void *operator new(size_t);

void operator delete(void *);


class Thread {
public:
    Thread(void (*body)(void *), void *arg);

    virtual ~Thread();

    int start();

    void join();

    void join(time_t);

    static int kill(Thread *);

    static void dispatch();

    static int sleep(time_t);

    static void threadStart(void *);

protected:
    Thread();

    virtual void run() {}

private:
    thread_t myHandle;

    void (*body)(void *);

    void *arg;
};


class Semaphore {
public:

    explicit Semaphore(unsigned init);

    virtual ~Semaphore();

    virtual int wait();

    virtual int signal();

    static int signal_and_wait(Semaphore &sem1, Semaphore &sem2);

protected:
    sem_t myHandle;

};

class Mutex : public Semaphore {
public:
    Mutex() : Semaphore(1) {}
};


class PeriodicThread : public Thread {
public:
    void terminate();

protected:
    explicit PeriodicThread(time_t period);

    virtual void periodicActivation() {}

private:
    time_t period;
};

class Console {
public:
    static char getc();

    static void putc(char);
};

#endif