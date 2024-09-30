#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

const uint8_t* HOST_RESERVE = 0;
size_t HOST_RESERVE_SIZE = 0;

const char* BOT_NAME = "bot_c";
const uint32_t VERSION_MAJOR = 0;
const uint32_t VERSION_MINOR = 1;
const uint32_t VERSION_PATCH = 0;

extern void logFunction(unsigned int msgPtr, unsigned int msgLen);

void _log(const char* msg) {
    logFunction((size_t)msg, strlen(msg));
}

size_t setup(size_t requestReserve) {
    size_t buffSizeNeeded = snprintf(NULL, 0, "Reserving space for %zu bytes.", requestReserve);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    sprintf(msgBuffer, "Reserving space for %zu bytes.", requestReserve);
    _log(msgBuffer);
    free(msgBuffer);
    HOST_RESERVE = malloc(requestReserve);
    HOST_RESERVE_SIZE = requestReserve;

    const uint32_t MAX_NAME_LEN = 20;
    size_t bnLen = strlen(BOT_NAME);
    size_t nameLen = MAX_NAME_LEN > bnLen ? bnLen : MAX_NAME_LEN;
    size_t offset = 0;
    memcpy((void*)&HOST_RESERVE[offset], BOT_NAME, bnLen);
    memset((void*)&HOST_RESERVE[nameLen], 0, MAX_NAME_LEN-nameLen);
    offset += MAX_NAME_LEN;
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_MAJOR, sizeof(uint32_t));
    offset += sizeof(uint32_t);
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_MINOR, sizeof(uint32_t));
    offset += sizeof(uint32_t);
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_PATCH, sizeof(uint32_t));
    offset += sizeof(uint32_t);

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
