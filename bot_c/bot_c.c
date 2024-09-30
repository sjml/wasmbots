#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>

const uint8_t* HOST_RESERVE = 0;
size_t HOST_RESERVE_SIZE = 0;

extern void logFunction(unsigned int msgPtr, unsigned int msgLen);

void _log(const char* msg) {
    logFunction((size_t)msg, strlen(msg));
}

size_t setup(size_t requestReserve) {
    _log("C -> wasm reporting!");
    HOST_RESERVE = malloc(requestReserve);
    HOST_RESERVE_SIZE = requestReserve;
    return (size_t)HOST_RESERVE;
}

uint64_t fib(uint64_t n) {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}

bool runFib(size_t offset, size_t result) {
    if (result + sizeof(uint64_t) > HOST_RESERVE_SIZE) {
        _log("Invalid result offset");
        return false;
    }
    if (offset > HOST_RESERVE_SIZE) {
        _log("Invalid offset");
        return false;
    }
    const uint8_t n = HOST_RESERVE[offset];
    if (n > 93) {
        _log("Fib index too high");
        return false;
    }

    const uint64_t fibNum = fib(n);
    memcpy((void*)&HOST_RESERVE[result], &fibNum, sizeof(uint64_t));
    return true;
}
