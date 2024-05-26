#include "../h/iostream.hpp"
#include "../h/c_console.hpp"
#include "../h/string.hpp"

const stm::istream stm::cout;
const stm::endline stm::endl;

const stm::istream &stm::istream::operator<<(const char c) const {
    putc(c);
    return *this;
}

const stm::istream &stm::istream::operator<<(const char *string) const {
    print(string);
    return *this;
}

const stm::istream &stm::istream::operator<<(const stm::string &string) const {
    print(string.actual_string);
    return *this;
}

const stm::istream &stm::istream::operator<<(long long number) const {
    print(number);
    return *this;
}

const stm::istream &stm::istream::operator<<(int number) const {
    print(number);
    return *this;
}

const stm::istream &stm::istream::operator<<(uint64 number) const {
    print(number);
    return *this;
}

const stm::istream &stm::istream::operator<<(void *pointer) const {
    print_h((uint64) pointer);
    return *this;
}

const stm::istream &stm::istream::operator<<(bool truth) const {
    print(truth ? "true" : "false");
    return *this;
}

const stm::istream &stm::istream::operator<<(const stm::endline &) const {
    putc('\n');
    return *this;
}
