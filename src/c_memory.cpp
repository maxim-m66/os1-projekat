#include "../h/c_memory.hpp"
#include "../h/c_console.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    *Allocator::free_pointer = {nullptr, (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR - Allocator::HEADER_SIZE};
}

void *Allocator::_mem_alloc(size_t size) {
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    if (Allocator::free_pointer->size < size) {
        for (previous = Allocator::free_pointer, available = previous->next;
             available and available->size < size; previous = available, available = available->next);
    }
    if (!available) return nullptr;
    if (available->size - 2 * Allocator::HEADER_SIZE - size > 0) {
        next_node = (Allocator::MemoryBlock *) ((uint64) available + Allocator::HEADER_SIZE + size);
        next_node->next = available->next;
        next_node->size = available->size - 2 * Allocator::HEADER_SIZE - size;
        available->size = size;
    } else {
        next_node = available->next;
    }
    if (previous) previous->next = next_node;
    else Allocator::free_pointer = next_node;
    available->next = (Allocator::MemoryBlock *) ((uint64) &(available->next) ^ available->size);
    return (void *) (available + 1);
}

int Allocator::_mem_free(const void *pointer) {
    if (pointer < HEAP_START_ADDR) return -2;
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    if (freed->next != (Allocator::MemoryBlock *) ((uint64) &(freed->next) ^ freed->size)) {
        return -1;
    }
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next = nullptr;
    if (freed < Allocator::free_pointer) next = Allocator::free_pointer;
    else for (next = previous->next; next and !(previous < freed and next > freed); previous = next, next = next->next);
    if (previous and (uint64) previous + previous->size == (uint64) &freed) {
        previous->size += freed->size + Allocator::HEADER_SIZE;
    }
    if (next and (uint64) pointer + freed->size == (uint64) &next) {
        Allocator::MemoryBlock *new_next = next->next;
        previous->next = freed;
        freed->size += next->size + Allocator::HEADER_SIZE;
        freed->next = new_next;
    } else {
        previous->next = freed;
        freed->next = next;
    }
    return 0;
}

/*int Allocator::freePointer = 0;
int Allocator::MEM = 0;
void *Allocator::HEAP_BEGIN = nullptr;
MemoryBlock *Allocator::memoryBlocks = nullptr;


void *Allocator::_mem_alloc(int blocks) {
    for (int i = Allocator::freePointer; i < Allocator::MEM;) {
        if (Allocator::memoryBlocks[i].taken || Allocator::memoryBlocks[i].length < blocks) {
            i = i + Allocator::memoryBlocks[i].length;
        } else {
            Allocator::memoryBlocks[i].taken = true;
            Allocator::memoryBlocks[i].length = blocks;
            for (int j = i - 1; !Allocator::memoryBlocks[j].taken && j >= 0; j--) {
                Allocator::memoryBlocks[j].length = i - j;
            }
            while (Allocator::memoryBlocks[Allocator::freePointer].taken)
                Allocator::freePointer += Allocator::memoryBlocks[Allocator::freePointer].length;
            return Allocator::memoryBlocks[i].begin;
        }
    }
    return nullptr;
}

int Allocator::_mem_free(const void *mem) {
    for (int i = 0; i < Allocator::MEM && Allocator::memoryBlocks[i].begin <= mem; i++) {
        if (Allocator::memoryBlocks[i].begin == mem && Allocator::memoryBlocks[i].taken) {
            Allocator::memoryBlocks[i].taken = false;
            int next = i + Allocator::memoryBlocks[i].length;
            if (Allocator::memoryBlocks[next].taken) {
                for (int j = next - 1; !Allocator::memoryBlocks[j].taken && j >= 0; j--) {
                    Allocator::memoryBlocks[j].length = next - j;
                }
            } else {
                int len = Allocator::memoryBlocks[next].length;
                for (int j = next - 1; !Allocator::memoryBlocks[j].taken && j >= 0; j--) {
                    Allocator::memoryBlocks[j].length = ++len;
                }
            }
            if (Allocator::freePointer < i) Allocator::freePointer = i;
            return 0;
        }
    }
    return -1;
}


void Allocator::mem_init() {
    Allocator::freePointer = 0;
    Allocator::MEM = ((uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR) / (MEM_BLOCK_SIZE + sizeof(MemoryBlock));
    Allocator::HEAP_BEGIN = (void *) ((uint64) HEAP_START_ADDR + Allocator::MEM * sizeof(MemoryBlock));
    Allocator::memoryBlocks = (MemoryBlock *) HEAP_START_ADDR;
    for (int i = 0; i < Allocator::MEM; i++) {
        Allocator::memoryBlocks[i].begin = (void *) ((uint64) Allocator::HEAP_BEGIN + i * MEM_BLOCK_SIZE);
        Allocator::memoryBlocks[i].taken = false;
        Allocator::memoryBlocks[i].length = Allocator::MEM - i;
    }
}

void Allocator::mem_show() {
    for (int i = 0; i < 30; i++) {
        print_h((uint64) Allocator::memoryBlocks[i].begin);
        putc(' ');
        print_n(Allocator::memoryBlocks[i].length);
        putc(' ');
        Allocator::memoryBlocks[i].taken ? print_s("taken") : print_s("free");
        print_s(" \n");
    }
    print_u(Allocator::freePointer);
}*/

void memcpy(const void *src, const void *dst, int len) {
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
        dst1[i] = src1[i];
}