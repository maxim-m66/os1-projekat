#ifndef PROJECT_BASE_C_MEMORY_HPP
#define PROJECT_BASE_C_MEMORY_HPP
#include "../lib/hw.h"

void memcpy(const void *src, const void *dst, int len);


class Allocator {
public:
    static void *_mem_alloc(size_t size);

    static int _mem_free(const void *);

    static void mem_init();

    __attribute__((unused)) static bool mem_check();

    __attribute__((unused)) static void mem_show();

    __attribute__((unused)) static int mem_size();

private:

    struct MemoryBlock {
        MemoryBlock *next;
        uint64 size;
    };

    static bool adjacent(MemoryBlock *block1, MemoryBlock *block2);

    static void merge(MemoryBlock *block1, MemoryBlock *block2);

    static uint64 constexpr HEADER_SIZE = 2 * sizeof(uint64);

    static MemoryBlock *free_pointer;
};

#endif