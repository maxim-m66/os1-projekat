#include "../h/c_semaphore.hpp"
#include "../h/c_console.hpp"
#include "../h/cpp_semaphores.hpp"
#include "../h/string.hpp"

IOBuffer IO::Input{};
IOBuffer IO::Output{};
extern OwnedMutex *printer;

void IOBuffer::init() {
    this->buffer.init();
    sem_open(&this->empty, 0);
}

void IOBuffer::put(char c) {
    this->buffer.put(c);
    Sem::_sem_signal(this->empty);
}

char IOBuffer::get() {
    Sem::_sem_wait(this->empty);
    char ret = this->buffer.get();
    return ret;
}

void IO::init() {
    Input.init();
    Output.init();
}

char IO::_getc() {
    return Input.get();
}

void IO::_putc(char c) {
    if (c == 127) {
        Output.put(8);
        Output.put(' ');
        Output.put(8);
    } else {
        Output.put(c);
    }
}

void print(const char *str) {
    int i = 0;
    printer->wait();
    while (str[i]) {
        putc(str[i++]);
    }
    printer->signal();
}

void dramatic_print(const char *str) {
    int i = 0;
    printer->wait();
    while (str[i]) {
        putc(str[i++]);
        time_sleep(1);
    }
    printer->signal();
}

void print(long long number) {
    char buff[25] = {};
    print(stm::ntos(number, buff, 10));
}

void print(int number) {
    print((long long) number);
}

void print(uint64 number) {
    char buff[25] = {};
    print(stm::utos(number, buff, 10));
}

void print_h(uint64 number) {
    char buff[25] = {};
    print(stm::utos(number, buff, 16));
}