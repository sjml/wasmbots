#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdarg.h>

const uint8_t* HOST_RESERVE = 0;
size_t HOST_RESERVE_SIZE = 0;

const char* BOT_NAME = "bot_c";
const uint16_t VERSION_MAJOR = 0;
const uint16_t VERSION_MINOR = 1;
const uint16_t VERSION_PATCH = 0;

const uint16_t GP_VERSION = 7;

extern void logFunction(unsigned int msgPtr, unsigned int msgLen);

void _log(const char* msg) {
    logFunction((size_t)msg, strlen(msg));
}

void _logf(const char* fmt, ...) {
    va_list argptr;
    va_start(argptr, fmt);
    size_t buffSizeNeeded = vsnprintf(NULL, 0, fmt, argptr);
    va_end(argptr);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    va_start(argptr, fmt);
    vsprintf(msgBuffer, fmt, argptr);
    va_end(argptr);

    _log(msgBuffer);
    free(msgBuffer);
}

size_t setup(size_t requestReserve) {
    _logf("Reserving space for %zu bytes.", requestReserve);
    HOST_RESERVE = malloc(requestReserve);
    HOST_RESERVE_SIZE = requestReserve;

    const uint32_t MAX_NAME_LEN = 26;
    size_t bnLen = strlen(BOT_NAME);
    size_t nameLen = MAX_NAME_LEN > bnLen ? bnLen : MAX_NAME_LEN;
    size_t offset = 0;
    memcpy((void*)&HOST_RESERVE[offset], BOT_NAME, bnLen);
    memset((void*)&HOST_RESERVE[nameLen], 0, MAX_NAME_LEN-nameLen);
    offset += MAX_NAME_LEN;
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_MAJOR, sizeof(uint16_t));
    offset += sizeof(uint16_t);
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_MINOR, sizeof(uint16_t));
    offset += sizeof(uint16_t);
    memcpy((void*)&HOST_RESERVE[offset], &VERSION_PATCH, sizeof(uint16_t));
    offset += sizeof(uint16_t);

    return (size_t)HOST_RESERVE;
}

bool receiveGameParams(size_t offset) {
    uint16_t gpVersion;
    memcpy(&gpVersion, HOST_RESERVE + offset, 2);
    if (gpVersion != GP_VERSION) {
        _logf("ERROR: Can't parse GameParams v%d; only prepared for v%d", gpVersion, GP_VERSION);
        return false;
    }

    // don't care about rest

    return true;
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
