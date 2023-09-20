#ifndef PROJECT_BASE_STRING_HPP
#define PROJECT_BASE_STRING_HPP


#include "../lib/hw.h"

namespace stm {

    int strlen(const char *string);

    void strcpy(const char *src, char *dst);

    void strncpy(char *src, char *dst, int max_len);

    char *strcat(const char *base, const char *tail);

    int strcmp(const char *str1, const char *str2);

    char *ntos(long long number, char* buffer, int radix);

    char *utos(uint64 number, char* buffer, int radix);

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

        explicit String(long long);

        explicit String(uint64);

        String(const String &string) { this->copy(string); }

        String(String &&string) { this->move(string); }

        String &operator=(const String &);

        String &operator=(String &&) noexcept;

        char &operator[](int i);

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

        int size;
        char *actual_string;
        friend class istream;
    };

}
#endif