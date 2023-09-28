#include "../h/cpp_semaphores.hpp"
#include "../h/c_thread.hpp"

int OwnedSemaphore::wait() {
    if (this->owner == TCB::running) {
        return 0;
    }
    if (this->owner == nullptr) {
        this->owner = TCB::running;
    }
    return this->Semaphore::wait();
}

int OwnedSemaphore::signal() {
    if (this->owner == TCB::running) {
        this->owner = nullptr;
    }
    return this->Semaphore::signal();
}