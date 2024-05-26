#ifndef PROJECT_BASE_IOSTREAM_HPP
#define PROJECT_BASE_IOSTREAM_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"

namespace stm {
    class string;

    class endline {

    };

    class istream final {
    public:
        const istream &operator<<(const char c) const;

        const istream &operator<<(const char *string) const;

        const istream &operator<<(const string &string) const;

        const istream &operator<<(long long number) const;

        const istream &operator<<(int number) const;

        const istream &operator<<(uint64 number) const;

        const istream &operator<<(void *pointer) const;

        const istream &operator<<(bool truth) const;

        const istream &operator<<(const endline &) const;
    };

    class ostream final {
        void operator>>(const string &string);
    };

    extern const istream cout;
    extern const endline endl;
}
#endif
