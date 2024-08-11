#include "../h/c_sleep.hpp"
#include "../h/c_thread.hpp"
#include "../h/scheduler.hpp"

Cradle::elem *Cradle::head = nullptr;
Cradle::elem *Cradle::tail = nullptr;

void *Cradle::elem::operator new(size_t size) {
    return Allocator::_mem_alloc(size);
}

void Cradle::elem::operator delete(void *mem) {
    Allocator::_mem_free(mem);
}

void Cradle::insert(TCB *thread, time_t time) {
    if (head == nullptr) {
        head = tail = new elem(thread, time);
        return;
    } else if (time < head->time_left) {
        head = new elem(thread, time, head);
        head->next->time_left -= time;
        return;
    }
    for (elem *curr = head; curr->next; curr = curr->next) {
        time -= curr->time_left;
        if (time < curr->next->time_left) {
            curr->next = new elem(thread, time, curr->next);
            curr->next->next->time_left -= time;
            return;
        }
    }
    tail->next = new elem(thread, time);
    tail = tail->next;
}

TCB *Cradle::remove() {
    elem *old = head;
    TCB *ret = old->handle;
    head = head->next;
    delete old;
    return ret;
}

void Cradle::update() {
    if (!head)
        return;
    head->time_left--;
    while (!is_empty() && peak() == 0) {
        thread_t next = remove();
        if (next->is_joined() || next->is_sleeping()) {
            next->run();
            Scheduler::put(next);
        }
    }
}

int Cradle::peak() {
    if (head)
        return head->time_left;
    else
        return -1;
}

bool Cradle::is_empty() {
    return head == nullptr;
}

int Cradle::_time_sleep(time_t ms) {
    insert(TCB::running, ms);
    TCB::running->sleep();
    TCB::_thread_dispatch();
    return 0;
}

int Cradle::_thread_wake(thread_t thread) {
    if (!thread->is_sleeping())
        return -1;
    thread->run();
    Scheduler::put(thread);
    TCB::_thread_dispatch();
    return 0;
}
