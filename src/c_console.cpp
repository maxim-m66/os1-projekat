#include "../h/c_console.hpp"
#include "../h/cpp_semaphores.hpp"

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
    Output.put(c);
    if ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) and !IO::Output.is_empty()) {
        char ch = IO::Output.get();
        *(volatile char *) CONSOLE_TX_DATA = ch;
    }
}

void print_s(const char *str) {
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

void print_n(long long number) {
    if (number == 0) {
        print_s("0");
        return;
    }
    char digits[21] = {};
    int i = 19;
    bool negative = number < 0;
    if (negative) number = -number;
    const char *av = "0123456789";
    while (number > 0) {
        digits[i--] = av[(number % 10)];
        number /= 10;
    }
    if (negative) digits[i--] = '-';
    print_s(&digits[i + 1]);
}

void print_u(uint64 number) {
    if (number == 0) {
        print_s("0");
        return;
    }
    char digits[21] = {};
    int i = 19;
    const char *av = "0123456789";
    while (number > 0) {
        digits[i--] = av[(number % 10)];
        number /= 10;
    }
    print_s(&digits[i + 1]);
}

void print_h(uint64 number) {
    if (number == 0) {
        print_s("0");
        return;
    }
    char digits[21] = {};
    int i = 19;
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[number % 16];
        number /= 16;
    }
    print_s(&digits[i + 1]);
}