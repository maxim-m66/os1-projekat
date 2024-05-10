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

    class String;

    String &operator+(const String &string1, const String &string2);

    bool operator==(const String &string1, const String &string2);

    bool operator<(const String &string1, const String &string2);

    bool operator!=(const String &string1, const String &string2);

    bool operator>(const String &string1, const String &string2);

    bool operator<=(const String &string1, const String &string2);

    bool operator>=(const String &string1, const String &string2);

    class String final {
    public:
        String(const char *);

        String(char);

        explicit String(long long);

        explicit String(int);

        explicit String(uint64);

        String(const String &string) { this->copy(string); }

        String(String &&string) { this->move(string); }

        String &operator=(const String &);

        String &operator=(String &&) noexcept;

        int length() const { return this->size; }

        char &operator[](int i) {
            return this->actual_string[i];
        }

        const char &operator[](int i) const{
            return this->actual_string[i];
        }

        friend String &operator+(const String &string1, const String &string2);

        String &operator+=(const String &string);

        friend bool operator==(const String &string1, const String &string2);

        friend bool operator<(const String &string1, const String &string2);

        friend bool operator!=(const String &string1, const String &string2) { return !(string1 == string2); }

        friend bool operator>(const String &string1, const String &string2) {
            return string1 != string2 && !(string1 < string2);
        }

        friend bool operator<=(const String &string1, const String &string2) { return !(string1 > string2); }

        friend bool operator>=(const String &string1, const String &string2) { return !(string1 < string2); }

        ~String() { this->unexist(); }

    private:
        void copy(const String &);

        void move(String &);

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