#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "circular_buffer.hpp"
#include "syscall_c.hpp"

class Scheduler final {
public:

    static inline void init() { runnable.init(); }

    static inline void put(TCB *thread) { runnable.put(thread); }

    static inline TCB *get() { return runnable.get(); }

    static inline bool is_empty() { return runnable.is_empty(); }

    static inline TCB *peek() { return runnable.peek(); }

protected:
    Scheduler() = default;

private:
    static os::CircularBuffer<TCB *> runnable;
};

#endif