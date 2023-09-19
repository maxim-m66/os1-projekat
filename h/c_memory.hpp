#ifndef PROJECT_BASE_C_MEMORY_HPP
#define PROJECT_BASE_C_MEMORY_HPP

#include "../lib/hw.h"

/*struct MemoryBlock {
    void *begin;
    bool taken;
    int length;
};

class Allocator {
public:
    static void *_mem_alloc(int);

    static int _mem_free(const void *);

    static void mem_init();

    static void mem_show();

private:

    static int MEM;

    static int freePointer;

    static void *HEAP_BEGIN;

    static MemoryBlock *memoryBlocks;
};*/

void memcpy(const void *src, const void *dst, int len);

class Allocator {
public:
    static void *_mem_alloc(size_t size);

    static int _mem_free(const void *);

    static void mem_init();

    static void mem_show();

private:

    struct MemoryBlock {
        MemoryBlock(MemoryBlock *next, uint64 size) : next(next), size(size) {}

        MemoryBlock *next;
        uint64 size;
    };

    static uint64 constexpr HEADER_SIZE = 2 * sizeof(uint64);

    static MemoryBlock *free_pointer;
};

#endif