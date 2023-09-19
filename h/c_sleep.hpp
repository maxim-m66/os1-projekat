#ifndef PROJECT_BASE_RQUEUE_H
#define PROJECT_BASE_RQUEUE_H

#include "c_memory.hpp"

class TCB;

class Cradle {
public:

    static void insert(TCB *, time_t);

    static TCB *remove();

    static void update();

    static int peak();

    static bool is_empty();

    static int _time_sleep(time_t);

private:
    struct elem {
        void *operator new(size_t size) {
            return Allocator::_mem_alloc(size);
        }

        void operator delete(void *mem) {
            Allocator::_mem_free(mem);
        }

        elem(TCB *handle, time_t time, elem *next = nullptr) : handle(handle), time_left(time), next(next) {}

        TCB *handle;
        time_t time_left;
        elem *next;
    };

    static elem *head;
    static elem *tail;
};

#endif