#ifndef PROJECT_BASE_STRING_HPP
#define PROJECT_BASE_STRING_HPP


#include "../lib/hw.h"

namespace stm {

    int strlen(const char *string);

    char *strcpy(const char *src, char *dst);

    void strncpy(char *src, char *dst, int max_len);

    char *strcat(const char *base, const char *tail);

    int strcmp(const char *str1, const char *str2);

    char *ntos(long long number, char *buffer, int radix);

    char *utos(uint64 number, char *buffer, int radix);

    class string;

    string &operator+(const string &string1, const string &string2);

    bool operator==(const string &string1, const string &string2);

    bool operator<(const string &string1, const string &string2);

    bool operator!=(const string &string1, const string &string2);

    bool operator>(const string &string1, const string &string2);

    bool operator<=(const string &string1, const string &string2);

    bool operator>=(const string &string1, const string &string2);

    class string final {
    public:
        string() = default;

        string(const char *);

        string(char);

        explicit string(long long);

        explicit string(int);

        explicit string(uint64);

        string(const string &string) { this->copy(string); }

        string(string &&string) { this->move(string); }

        string &operator=(const string &);

        string &operator=(string &&) noexcept;

        int length() const { return this->size; }

        char &operator[](int i) {
            return this->actual_string[i];
        }

        const char &operator[](int i) const{
            return this->actual_string[i];
        }

        friend string &operator+(const string &string1, const string &string2);

        string &operator+=(const string &string);

        friend bool operator==(const string &string1, const string &string2);

        friend bool operator<(const string &string1, const string &string2);

        friend bool operator!=(const string &string1, const string &string2) { return !(string1 == string2); }

        friend bool operator>(const string &string1, const string &string2) {
            return string1 != string2 && !(string1 < string2);
        }

        friend bool operator<=(const string &string1, const string &string2) { return !(string1 > string2); }

        friend bool operator>=(const string &string1, const string &string2) { return !(string1 < string2); }

        ~string() { this->unexist(); }

    private:
        void copy(const string &);

        void move(string &);

        void unexist() { delete[] this->actual_string; }

        static int write_and_count(const char *src, char *dst, int n);

        static int constexpr SMALL_SIZE = 30;

        int size;
        char *actual_string;
        char small_string[SMALL_SIZE + 1];

        friend class istream;
    };

}
#endif