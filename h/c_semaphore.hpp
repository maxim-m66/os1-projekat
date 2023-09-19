#ifndef PROJECT_BASE_C_SEMAPHORE_HPP
#define PROJECT_BASE_C_SEMAPHORE_HPP

#include "scheduler.hpp"
#include "syscall_c.hpp"

class TCB;

class Sem final {
public:
    static int _sem_open(sem_t *, unsigned);

    static int _sem_close(sem_t);

    static int _sem_wait(sem_t);

    static int _sem_signal(sem_t);

private:
    unsigned count;
    os::CircularBuffer<TCB*> blocked;
};


#endif
