#include "vicuna_crt.h"

// TODO(fabianpedd): This is a super hacky malloc implementation that only works
// because we only have concurrent accesses to memory

int lock = 0;
void *vicuna_malloc(size_t size)
{
    (void)size;
    if (lock != 0)
    {
        printf("ERROR: vicuna_malloc() is too dumb for what you are trying to do...\n");
        __asm__ volatile("unimp");
    }
    lock = 1;
    static uint8_t buffer[16384];
    return (void *)buffer;
}

void vicuna_free(void *ptr)
{
    lock = 0;
    (void)ptr;
}
