#include "../h/c_semaphore.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

int Sem::_sem_open(sem_t *handle, unsigned init) {
    sem_t semaphore = (sem_t) Allocator::_mem_alloc(sizeof(Sem));
    if (!semaphore) {
        return 1;
    }
    semaphore->count = init;
    semaphore->blocked.init();
    *handle = semaphore;
    return 0;
}

int Sem::_sem_close(sem_t id) {
    if (!id) return 1;
    while (!id->blocked.is_empty()) {
        thread_t next = id->blocked.get();
        Scheduler::put(next);
    }
    id->blocked.destroy();
    if (Allocator::_mem_free(id)) return 2;
    return 0;
}

int Sem::_sem_wait(sem_t id) {
    if (!id) return 1;
    int ret = 0;
    if (id->count == 0) {
        TCB::running->block();
        id->blocked.put(TCB::running);
        TCB::_thread_dispatch();
        if (TCB::running->is_blocked()) {
            TCB::running->run();
            ret = -1;
        }
    } else {
        id->count--;
    }
    return ret;
}

int Sem::_sem_signal(sem_t id) {
    if (!id) return 1;
    if (!id->blocked.is_empty()) {
        thread_t next = id->blocked.get();
        next->run();
        Scheduler::put(next);
        TCB::_thread_dispatch();
    } else {
        id->count++;
    }
    return 0;
}

int Sem::_sem_signal_all(Sem * id) {
    if (!id) return 1;
    while (!id->blocked.is_empty()) {
        thread_t next = id->blocked.get();
        Scheduler::put(next);
        id->count++;
    }
    return 0;
}

int Sem::_sem_signal_wait(Sem *id1, Sem* id2) {
    _sem_signal(id1);
    return _sem_wait(id2);
}
