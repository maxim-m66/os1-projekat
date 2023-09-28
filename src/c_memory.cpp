#include "../h/c_memory.hpp"
#include "../h/iostream.hpp"

Allocator::MemoryBlock *Allocator::free_pointer = nullptr;

void Allocator::mem_init() {
    Allocator::free_pointer = (Allocator::MemoryBlock *) HEAP_START_ADDR;
    *Allocator::free_pointer = {nullptr, (uint64) HEAP_END_ADDR - (uint64) HEAP_START_ADDR - Allocator::HEADER_SIZE};
}

void *Allocator::_mem_alloc(size_t size) {
    Allocator::MemoryBlock *available = Allocator::free_pointer, *previous = nullptr, *next_node;
    if (available && available->size < size) {
        for (previous = available, available = available->next; available && available->size < size;
             previous = available, available = available->next);
    }
    if (!available) return nullptr;
    if (available->size > Allocator::HEADER_SIZE + size) {
        uint64 next_size = available->size - size - Allocator::HEADER_SIZE;
        available->size = size;
        next_node = (Allocator::MemoryBlock *) ((uint64) available + Allocator::HEADER_SIZE + size);
        next_node->next = available->next;
        next_node->size = next_size;
    } else {
        next_node = available->next;
    }
    available->next = (MemoryBlock *) ((uint64) available ^ available->size);
    if (previous) previous->next = next_node;
    else Allocator::free_pointer = next_node;
    return (void *) (available + 1);
}

int Allocator::_mem_free(const void *pointer) {
    Allocator::MemoryBlock *freed = (Allocator::MemoryBlock *) pointer - 1;
    if (freed < HEAP_START_ADDR) return -1;
    if (freed->next != (MemoryBlock *) ((uint64) freed ^ freed->size)) return -2;
    Allocator::MemoryBlock *previous = Allocator::free_pointer, *next_node;
    if (freed < Allocator::free_pointer) {
        next_node = Allocator::free_pointer;
        Allocator::free_pointer = freed;
        previous = nullptr;
    } else {
        for (next_node = previous->next; next_node && !(previous < freed && next_node > freed);
             previous = next_node, next_node = next_node->next);
    }
    Allocator::merge(freed, next_node);
    Allocator::merge(previous, freed);
    return 0;
}

inline void Allocator::merge(MemoryBlock *block1, MemoryBlock *block2) {
    if (!block1) return;
    if (block2 && Allocator::adjacent(block1, block2)) {
        block1->next = block2->next;
        block1->size += Allocator::HEADER_SIZE + block2->size;
    } else {
        block1->next = block2;
    }
}

__attribute__((unused))
bool Allocator::mem_check() {
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
        if (Allocator::adjacent(curr, curr->next)) return false;
    }
    return true;
}

__attribute__((unused))
void Allocator::mem_show() {
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr->next; curr = curr->next) {
        stm::cout << curr << stm::endl << curr->next << stm::endl << stm::endl;
    }
}

__attribute__((unused))
int Allocator::mem_size() {
    int i = 0;
    for (Allocator::MemoryBlock *curr = Allocator::free_pointer; curr; i += curr->size, curr = curr->next);
    return i;
}

void memcpy(const void *src, const void *dst, int len) {
    char *src1 = (char *) src;
    char *dst1 = (char *) dst;
    for (int i = 0; i < len; i++)
        dst1[i] = src1[i];
}