#include "../h/scheduler.hpp"
#include "../h/c_thread.hpp"

os::CircularBuffer<TCB*> Scheduler::runnable{};