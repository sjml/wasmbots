#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdarg.h>

#include "wasmbot_client.h"

const char* BOT_NAME = "bot_c";
const uint16_t BOT_VERSION[3] = {0, 1, 0};

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

wsmbtclnt_BotMetadata clientSetup(wsmbtclnt_GameParameters params) {
    wsmbtclnt_setTickCallback(&clientTick);

    wsmbtclnt_BotMetadata botMeta;

    memset(botMeta.name, 0, sizeof(botMeta.name));
    size_t copyLength = strlen(BOT_NAME) < WSMBTCLNT_MAX_BOT_NAME_LEN ? strlen(BOT_NAME) : WSMBTCLNT_MAX_BOT_NAME_LEN;
    memcpy(botMeta.name, BOT_NAME, copyLength);

    botMeta.botVersion[0] = BOT_VERSION[0];
    botMeta.botVersion[1] = BOT_VERSION[1];
    botMeta.botVersion[2] = BOT_VERSION[2];

    botMeta.ready = true;

    wsmbtclnt_log("Good to go!");
    return botMeta;
}
