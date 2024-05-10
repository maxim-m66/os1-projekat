#ifndef PROJECT_BASE_SMART_POINTER_HPP
#define PROJECT_BASE_SMART_POINTER_HPP

#include "iostream.hpp"

namespace stm {
    template<typename T>
    class unique_pointer {
    public:
        unique_pointer(const T &);

        unique_pointer(unique_pointer &p) = delete;

        unique_pointer &operator=(unique_pointer &p) = delete;

        ~unique_pointer();

    private:
        T *pointer;
    };

    template<typename T>
    unique_pointer<T>::unique_pointer(const T &t) {
        this->pointer = new T(t);
    }

    template<typename T>
    unique_pointer<T>::~unique_pointer() {
        delete this->pointer;
    }
}
#endif
