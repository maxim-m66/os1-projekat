//
// Created by os on 5/10/24.
//

#ifndef PROJECT_BASE_VECTOR_HPP
#define PROJECT_BASE_VECTOR_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"

namespace stm {

    template<typename T>
    class vector final {
    public:

        vector();

        explicit vector(int init_size);

        void push_back(T const &value);

        void push_front(T const &value);

        T pop_back();

        T pop_front();

        T &operator[](int index);

        int size() const { return _size; }

    private:
        void reallocate_front(T *new_data);

        void reallocate_back(T *new_data);

        static int constexpr DEFAULT_SIZE = 40;
        T *data;
        int _size;
        int front;
        int back;
        int capacity;
    };

    template<typename T>
    vector<T>::vector(int init_size) : data(new T[init_size]), _size(0), front(init_size / 2),
                                       back(init_size / 2), capacity(init_size) {}

    template<typename T>
    vector<T>::vector() : vector(DEFAULT_SIZE) {}


    template<typename T>
    void vector<T>::push_back(const T &value) {
        if (back == capacity - 1) {
            T *new_data = (T*) mem_alloc(capacity << 1);// new T[capacity << 1];
            reallocate_back(new_data);
        }
        _size++;
        data[back++] = value;
    }

    template<typename T>
    void vector<T>::push_front(const T &value) {
        if (front == 0) {
            T *new_data = (T*) mem_alloc(capacity << 1);//new T[capacity << 1];
            reallocate_front(new_data);
        }
        _size++;
        data[front--] = value;
    }

    template<typename T>
    T vector<T>::pop_back() {
        _size--;
        return data[back--];
    }

    template<typename T>
    T vector<T>::pop_front() {
        _size--;
        return data[front++];
    }

    template<typename T>
    T &vector<T>::operator[](int index) {
        index = (index >= 0) ? index : _size + index;
        if (index >= _size) {
            return data[0];
        }
        return data[front + index];
    }


    template<typename T>
    void vector<T>::reallocate_front(T *new_data) {
        for (int i = 0; i < _size; i++) {
            new_data[i + capacity] = data[i];
        }
        delete[] data;
        data = new_data;
        capacity <<= 1;
    }


    template<typename T>
    void vector<T>::reallocate_back(T *new_data) {
        for (int i = 0; i < _size; i++) {
            new_data[i] = data[i];
        }
        delete[] data;
        data = new_data;
        capacity <<= 1;
    }

} // stm

#endif //PROJECT_BASE_VECTOR_HPP
