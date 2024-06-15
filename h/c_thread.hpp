#ifndef PROJECT_BASE_C_THREAD_HPP
#define PROJECT_BASE_C_THREAD_HPP

#include "syscall_c.hpp"
#include "../lib/hw.h"
#include "circular_buffer.hpp"

using run_t = void (*)(void *);

struct Context {
    uint64 ra;
    uint64 sp;
    uint64 sstatus;
    uint64 sepc;
};

enum Status {
    RUNNABLE, BLOCKED, SLEEPING, JOINED, FINISHED
};

class TCB final {
public:
    static int _thread_create(thread_t *, void(*)(void *), void *, void *);

    static void _thread_exit();

    static void _thread_dispatch();

    static void _thread_join(thread_t);

    static void _thread_join_time(thread_t, time_t);

    static int _fork();

    static int _kill(TCB *);

    static void thread_start();

    static void context_switch(Context *, Context *);

    static void context_inherit(Context*);

    static TCB *destroy_thread(TCB *);

    static void duplicate(TCB *, TCB *);

    TCB(run_t, void *, void *, Context);

    TCB(TCB &);

    bool is_runnable() const { return this->status == RUNNABLE; }

    bool is_blocked() const { return this->status == BLOCKED; }

    bool is_sleeping() const { return this->status == SLEEPING; }

    bool is_joined() const { return this->status == JOINED; }

    bool is_finished() const { return this->status == FINISHED; }

    void run() { this->status = RUNNABLE; }

    void block() { this->status = BLOCKED; }

    void sleep() { this->status = SLEEPING; }

    void enjoin() { this->status = JOINED; }

    void finish() { this->status = FINISHED; }

    bool was_preempted() const { return this->preempted; }

    void set_preempted() { this->preempted = true; }

    void reset_preempted() { this->preempted = false; }

    time_t get_time_slice() const { return this->time_slice; }

    void set_time_slice(time_t time) { this->time_slice = time;}

    static int ID;
    static time_t timer_counter;
    static TCB *running;

private:

    const int t_id;
    const run_t _run;
    void *arg;
    const void *stack;
    const TCB *parent;
    Context context;
    Status status;
    time_t time_slice;
    bool preempted;
    stm::CircularBuffer<TCB *> joiner;
};

#endif