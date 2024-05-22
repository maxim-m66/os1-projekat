#ifndef PROJECT_BASE_CIRCULAR_BUFFER_HPP
#define PROJECT_BASE_CIRCULAR_BUFFER_HPP

#include "syscall_c.hpp"
#include "c_memory.hpp"

namespace stm {
    template<typename T>
    class CircularBuffer {
    public:

        void init();

        void put(T);

        T get();

        T &peek();

        inline bool is_empty() const { return this->size == 0; }

        void destroy();

    private:

        void extend();

        static int constexpr CAPACITY = 16;
        T *queue;
        int head;
        int tail;
        int size;
        int capacity;
    };
}

template<typename T>
void stm::CircularBuffer<T>::init() {
    this->head = 0;
    this->tail = 0;
    this->size = 0;
    this->capacity = CAPACITY;
    this->queue = (T *) mem_alloc(sizeof(T) * CAPACITY);
}

template<typename T>
void stm::CircularBuffer<T>::put(T element) {
    if (this->size == this->capacity) {
        this->extend();
    }
    this->queue[this->tail] = element;
    this->tail = (this->tail + 1) % this->capacity;
    this->size++;
}

template<typename T>
T stm::CircularBuffer<T>::get() {
    T ret = this->queue[this->head];
    this->head = (this->head + 1) % this->capacity;
    this->size--;
    return ret;
}

template<typename T>
T &stm::CircularBuffer<T>::peek() {
    return this->queue[this->head];
}

template<typename T>
void stm::CircularBuffer<T>::extend() {
    T *new_queue = (T *) mem_alloc(sizeof(T *) * this->capacity * 2);
    for (int i = 0, j = this->head; i < this->capacity; i++, j = (j + 1) % this->capacity)
        new_queue[i] = this->queue[j];
    mem_free(queue);
    this->queue = new_queue;
    this->head = 0;
    this->tail = this->capacity;
    this->capacity *= 2;
}

template<typename T>
void stm::CircularBuffer<T>::destroy() {
    mem_free(this->queue);
}

#endif