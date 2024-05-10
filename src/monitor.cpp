#include "../h/monitor.hpp"

int MonitorMutex::relinquish() {
    int ret = this->nesting_count;
    this->nesting_count = 1;
    return ret;
}

void MonitorMutex::reacquire(int count) {
    this->nesting_count = count;
}

MonitorLock::MonitorLock(MonitorMutex &mutex) : monitorMutex(mutex) {
    this->monitorMutex.wait();
}

MonitorLock::~MonitorLock() {
    this->monitorMutex.signal();
}

Conditional::Conditional(Monitor *monitor) : owner(monitor), count(0), blocker(0) {}

void Conditional::wait() {
    this->count++;
    int nesting = this->owner->monitorMutex.relinquish();
    Semaphore::signal_and_wait(this->owner->monitorMutex, this->blocker);
    this->owner->monitorMutex.reacquire(nesting);
    this->owner->monitorMutex.wait();
}

void Conditional::signal() {
    if (this->count == 0) return;
    this->blocker.signal();
    this->count--;
}

void Conditional::signalAll() {
    for (unsigned int i = 0; i < this->count; i++)
        this->blocker.signal();
    this->count = 0;
}