#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdarg.h>

#include "wasmbot_client.h"

const char* WSMBTCLNT_BOT_NAME = "bot_c";
const uint16_t WSMBTCLNT_VERSION_MAJOR = 0;
const uint16_t WSMBTCLNT_VERSION_MINOR = 1;
const uint16_t WSMBTCLNT_VERSION_PATCH = 0;

// intentionally inefficient fibonacci calculator
uint64_t fib(uint64_t n) {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}

bool runFib(size_t offset, size_t result) {
    const uint8_t n = wsmbtclnt_read_u8(offset);
    if (n == 0) {
        return false; // got an error, prolly
    }
    if (n > 93) {
        wsmbtclnt_logErr("Fib index too high");
        return false;
    }

    const uint64_t fibNum = fib(n);
    offset = wsmbtclnt_write_u64(offset, fibNum);
    return offset != 0;
}

void clientTick() {
    fib(40);
}

bool clientSetup(wsmbtclnt_GameParameters params) {
    wsmbtclnt_setTickCallback(&clientTick);
    wsmbtclnt_log("Good to go!");

    return true;
}
