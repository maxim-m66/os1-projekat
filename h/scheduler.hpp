#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "circular_buffer.hpp"
#include "syscall_c.hpp"

class Scheduler final {
public:

    static void init() { high_priority.init(); mid_priority.init(); low_priority.init(); }

    static void put(TCB *thread);

    static TCB *get();

    static inline bool is_empty() {
        return high_priority.is_empty() && mid_priority.is_empty() && low_priority.is_empty();
    }

    static TCB *peek();

    static void idle_body();

private:

    enum TimeSlice {
        HIGH_PRIORITY = DEFAULT_TIME_SLICE,
        MID_PRIORITY = 2 * DEFAULT_TIME_SLICE,
        LOW_PRIORITY = 4 * DEFAULT_TIME_SLICE
    };
    static TCB* idle_thread;
    static stm::CircularBuffer<TCB *> high_priority;
    static stm::CircularBuffer<TCB *> mid_priority;
    static stm::CircularBuffer<TCB *> low_priority;
};

#endif