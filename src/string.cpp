#include "../h/string.h"
#include "../h/c_memory.hpp"

int stm::strlen(const char *string) {
    int size;
    for (size = 0; string[size]; size++);
    return size;
}

void stm::strcpy(const char *const src, char *const dst) {
    memcpy(src, dst, strlen(src) + 1);
}

void stm::strncpy(char *const src, char *const dst, int max_len) {
    for (int i = 0; i < strlen(src) + 1; i++) {
        if (i >= max_len) {
            dst[i] = '\0';
            return;
        }
        dst[i] = src[i];
    }
}

char *stm::strcat(const char *const base, const char *const tail) {
    int base_len = strlen(base);
    char *new_base = new char[base_len + strlen(tail) + 1];
    strcpy(base, new_base);
    strcpy(tail, &new_base[base_len]);
    return new_base;
}

int stm::strcmp(const char *str1, const char *str2) { //negative means str1 < str2 (a < b) (a < aa)
    int i;
    for (i = 0; str1[i] && str2[i]; i++) {
        int difference = str1[i] - str2[i];
        if (difference) return difference;
    }
    if (!str1[i] && !str2[i]) return 0;
    else if (str1[i]) return 1;
    else return -1;
}

void stm::String::copy(const stm::String &string) {
    this->size = string.size;
    this->actual_string = new char[this->size];
    strcpy(string.actual_string, this->actual_string);
}

void stm::String::move(stm::String &string) {
    this->size = string.size;
    this->actual_string = string.actual_string;
    string.actual_string = nullptr;
}

stm::String::String(const char *string) : size(strlen(string)) {
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::String &stm::String::operator=(const stm::String &string) {
    if (this == &string) return *this;
    this->unexist();
    this->copy(string);
    return *this;
}

stm::String &stm::String::operator=(stm::String &&string) noexcept {
    if (this == &string) return *this;
    this->unexist();
    this->move(string);
    return *this;
}

stm::String &stm::String::operator+=(const stm::String &string) {
    *this = *this + string;
    return *this;
}

char &stm::String::operator[](int i) {
    return this->actual_string[i];
}

stm::String &stm::operator+(const stm::String &string1, const stm::String &string2) {
    return *(new stm::String(stm::strcat(string1.actual_string, string2.actual_string)));
}

bool stm::operator==(const stm::String &string1, const stm::String &string2) {
    return !stm::strcmp(string1.actual_string, string2.actual_string);
}

bool stm::operator<(const stm::String &string1, const stm::String &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}
