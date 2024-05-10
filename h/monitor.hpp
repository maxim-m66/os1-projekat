#ifndef PROJECT_BASE_MONITOR_HPP
#define PROJECT_BASE_MONITOR_HPP

#include "cpp_semaphores.hpp"

#define synchronized MonitorLock __monitorLock(this->monitorMutex);

class MonitorMutex : public OwnedMutex {
friend class Conditional;
protected:
    int relinquish();
    void reacquire(int count);
};

class MonitorLock {
public:
    explicit MonitorLock(MonitorMutex &mutex);

    ~MonitorLock();

private:
    MonitorMutex &monitorMutex;
};

class Monitor {
    friend class Conditional;

protected:
    MonitorMutex monitorMutex;
};

class Conditional {
public:
    explicit Conditional(Monitor *monitor);
    void wait();
    void signal();
    void signalAll();
private:
    Monitor *owner;
    unsigned count;
    Semaphore blocker;
};


#endif //PROJECT_BASE_MONITOR_HPP
