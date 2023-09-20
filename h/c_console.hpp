#ifndef PROJECT_BASE_C_CONSOLE_HPP
#define PROJECT_BASE_C_CONSOLE_HPP

#include "../lib/hw.h"
#include "../lib/console.h"
#include "c_semaphore.hpp"
#include "riscv.hpp"


class IOBuffer final {
public:
    void init();

    void put(char c);

    char get();

    bool is_empty() const { return this->buffer.is_empty(); }

private:
    os::CircularBuffer<char> buffer;
    Sem *empty;
};

class IO final {
public:

    static void init();

    static char _getc();

    static void _putc(char c);

    static IOBuffer Input;
    static IOBuffer Output;
};

void print_s(const char *str);

void dramatic_print(const char *str);

void print_n(long long number);

void print_u(uint64 number);

void print_h(uint64 number);

#endif //PROJECT_BASE_C_CONSOLE_HPP