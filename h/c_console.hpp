#ifndef PROJECT_BASE_C_CONSOLE_HPP
#define PROJECT_BASE_C_CONSOLE_HPP

#include "circular_buffer.hpp"
#include "riscv.hpp"

class Sem;

class IOBuffer final {
public:
    void init();

    void put(char c);

    char get();

    bool is_empty() const { return this->buffer.is_empty(); }

private:
    stm::CircularBuffer<char> buffer;
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

void print(const char *str);

void print(long long number);

void print(int number);

void print(uint64 number);

void print_h(uint64 number);

void dramatic_print(const char *str);

#endif