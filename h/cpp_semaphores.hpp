#ifndef PROJECT_BASE_CPP_SEMAPHORES_HPP
#define PROJECT_BASE_CPP_SEMAPHORES_HPP

#include "syscall_cpp.hpp"

class OwnedSemaphore : public Semaphore {
public:
    explicit OwnedSemaphore(int i) : Semaphore(i) { this->owner = nullptr; }

    int wait() override;

    int signal() override;

private:
    TCB *owner;
};

class OwnedMutex : public OwnedSemaphore {
public:
    OwnedMutex() : OwnedSemaphore(1) {}
};

#endif
