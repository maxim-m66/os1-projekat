#ifndef PROJECT_BASE_CPP_SEMAPHORES_HPP
#define PROJECT_BASE_CPP_SEMAPHORES_HPP

#include "syscall_cpp.hpp"

class OwnedMutex : public Mutex {
public:
    explicit OwnedMutex();
    ~OwnedMutex() override;
    int wait() override;
    int signal() override;

protected:
    thread_t owner;
    unsigned nesting_count;
};

#endif
