#ifndef PROJECT_BASE_C_SEMAPHORE_HPP
#define PROJECT_BASE_C_SEMAPHORE_HPP

#include "circular_buffer.hpp"

class TCB;

class Sem final {
public:
    static int _sem_open(Sem **, unsigned);

    static int _sem_close(Sem *);

    static int _sem_wait(Sem *);

    static int _sem_signal(Sem *);

    static int _sem_signal_all(Sem *);

    static int _sem_signal_wait(Sem *, Sem *);

private:
    unsigned count;
    stm::CircularBuffer<TCB *> blocked;
};


#endif
