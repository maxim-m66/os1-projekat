#include "../h/scheduler.hpp"
#include "../h/c_thread.hpp"

stm::CircularBuffer<TCB *> Scheduler::high_priority{};
stm::CircularBuffer<TCB *> Scheduler::mid_priority{};
stm::CircularBuffer<TCB *> Scheduler::low_priority{};

void Scheduler::put(TCB *thread) {
    if (!thread->was_preempted()) {
        thread->set_time_slice(TimeSlice::HIGH_PRIORITY);
        Scheduler::high_priority.put(thread);
        return;
    }
    thread->reset_preempted();
    time_t time_slice = thread->get_time_slice();
    if (time_slice == TimeSlice::HIGH_PRIORITY) {
        thread->set_time_slice(TimeSlice::MID_PRIORITY);
        Scheduler::mid_priority.put(thread);
    } else if (time_slice == TimeSlice::MID_PRIORITY) {
        thread->set_time_slice(TimeSlice::LOW_PRIORITY);
        Scheduler::low_priority.put(thread);
    } else {
        Scheduler::low_priority.put(thread);
    }
}

TCB *Scheduler::get() {
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.get();
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.get();
    return Scheduler::low_priority.get();
}

TCB *Scheduler::peek() {
    if (!Scheduler::high_priority.is_empty()) return Scheduler::high_priority.peek();
    if (!Scheduler::mid_priority.is_empty()) return Scheduler::mid_priority.peek();
    return Scheduler::low_priority.peek();
}
