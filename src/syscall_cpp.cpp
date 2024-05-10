//
// Created by os on 5/27/23.
//

#include "../h/syscall_cpp.hpp"
#include "../h/c_thread.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void *operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void *mem) {
    mem_free(mem);
}

void operator delete[](void *mem) {
    mem_free(mem);
}

Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
}

Thread::~Thread() {
    if (myHandle->is_finished())
        delete myHandle;
}

int Thread::start() {
    return thread_create(&myHandle, &threadStart, this);
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::join(time_t time) {
    thread_join(myHandle, time);
}

int Thread::kill(Thread *thread) {
    return thread_kill(thread->myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t ms) {
    return time_sleep(ms);
}

Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

void Thread::threadStart(void *arg) {
    Thread *thread = (Thread *) arg;
    if (thread->body) {
        thread->body(thread->arg);
    } else {
        thread->run();
    }
}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::signal_and_wait(Semaphore &sem1, Semaphore &sem2) {
    return ::signal_and_wait(sem1.myHandle, sem2.myHandle);
}

void PeriodicThread::terminate() {
    thread_exit();
}

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;
}

char Console::getc() {
    return getc();
}

void Console::putc(char c) {
    putc(c);
}