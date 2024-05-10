#ifndef PROJECT_BASE_RQUEUE_H
#define PROJECT_BASE_RQUEUE_H

#include "syscall_c.hpp"

class TCB;

class Cradle {
public:

    static void insert(TCB *, time_t);

    static TCB *remove();

    static void update();

    static int peak();

    static bool is_empty();

    static int _time_sleep(time_t);

    static int _thread_wake(TCB *);

private:
    struct elem {
        void *operator new(size_t size);

        void operator delete(void *mem);

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}

        TCB *handle;
        time_t time_left;
        elem *next;
    };

    static elem *head;
    static elem *tail;
};

#endif