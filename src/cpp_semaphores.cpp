#include "../h/cpp_semaphores.hpp"
#include "../h/c_thread.hpp"


OwnedMutex::OwnedMutex() : owner(nullptr), nesting_count(0) {
    sem_open(&this->myHandle, 1);
}

OwnedMutex::~OwnedMutex() {
    sem_close(this->myHandle);
}

int OwnedMutex::wait() {
    if (this->owner == TCB::running) {
        this->nesting_count++;
        return 0;
    }
    if (this->owner == nullptr) {
        this->owner = TCB::running;
        this->nesting_count = 1;
    }
    sem_wait(this->myHandle);
    return 0;
}

int OwnedMutex::signal() {
    if (this->owner != TCB::running) return -1;
    this->nesting_count --;
    if (this->nesting_count == 0) {
        this->owner = nullptr;
        sem_signal(this->myHandle);
    }
    return 0;
}


