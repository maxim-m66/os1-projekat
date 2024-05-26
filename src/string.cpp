#include "../h/string.hpp"
#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

int stm::strlen(const char *string) {
    int size;
    for (size = 0; string[size]; size++);
    return size;
}

char *stm::strcpy(const char *const src, char *const dst) {
    memcpy(src, dst, strlen(src) + 1);
    return dst;
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

char *stm::ntos(long long number, char *buffer, int radix) {
    if (radix < 2 || radix > 16) {
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    int i = 98;
    bool negative = number < 0;
    if (negative) number = -number;
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
        number /= radix;
    }
    if (negative) digits[i--] = '-';
    strcpy(&digits[++i], buffer);
    return buffer;
}

char *stm::utos(uint64 number, char *buffer, int radix) {
    if (radix < 2 || radix > 16) {
        buffer[0] = 0;
        return buffer;
    }
    if (number == 0) {
        buffer[0] = '0';
        buffer[1] = 0;
        return buffer;
    }
    char digits[100] = {};
    int i = 98;
    const char *av = "0123456789ABCDEF";
    while (number > 0) {
        digits[i--] = av[(number % radix)];
        number /= radix;
    }
    strcpy(&digits[++i], buffer);
    return buffer;
}

void stm::String::copy(const stm::String &string) {
    cout << 101;
    this->size = string.size;
    this->actual_string = this->size > String::SMALL_SIZE ? new char[this->size] : this->small_string;
    strcpy(string.actual_string, this->actual_string);
}

void stm::String::move(stm::String &string) {
    this->size = string.size;
    if(this->size > String::SMALL_SIZE)
        this->actual_string = string.actual_string;
    else
        this->actual_string = strcpy(string.actual_string, this->small_string);
    string.actual_string = nullptr;
}

stm::String::String(const char *string) {
    this->size = String::write_and_count(string, this->small_string, SMALL_SIZE);
    if (this->size != -1) {
        this->actual_string = this->small_string;
        return;
    }
    this->size = strlen(string);
    this->actual_string = new char[this->size + 1];
    strcpy(string, this->actual_string);
}

stm::String::String(char c) {
    this->size = 1;
    this->actual_string = this->small_string;
    this->actual_string[0] = c;
    this->actual_string[1] = 0;
}

stm::String::String(long long number) {
    this->actual_string = ntos(number, this->small_string, 10);
    this->size = strlen(this->actual_string);
}

stm::String::String(int number) : String((long long) number) {}

stm::String::String(uint64 number) {
    this->actual_string = utos(number, this->small_string, 10);
    this->size = strlen(this->actual_string);
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

stm::String &stm::operator+(const stm::String &string1, const stm::String &string2) {
    return *(new stm::String(stm::strcat(string1.actual_string, string2.actual_string)));
}

bool stm::operator==(const stm::String &string1, const stm::String &string2) {
    return !stm::strcmp(string1.actual_string, string2.actual_string);
}

bool stm::operator<(const stm::String &string1, const stm::String &string2) {
    return stm::strcmp(string1.actual_string, string2.actual_string) < 0;
}

int stm::String::write_and_count(const char *src, char *dst, int n) {
    int i;
    for (i = 0; src[i]; i++) {
        if (i >= n) return -1;
        dst[i] = src[i];
    }
    dst[i] = src[i];
    return i;
}