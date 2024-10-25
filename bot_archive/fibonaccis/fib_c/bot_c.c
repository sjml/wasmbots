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

uint64_t CURRENT_FIB = 35;
void clientTick(uint32_t lastDuration) {
    if (lastDuration < 250) {
        CURRENT_FIB += 1;
        wsmbt_logf("Incrementing fib to %lu", CURRENT_FIB);
    }
    fib(CURRENT_FIB);
}

wsmbt_BotMetadata clientSetup(wsmbt_GameParameters params) {
    wsmbt_registerTickCallback(&clientTick);

    wsmbt_BotMetadata botMeta;

    memset(botMeta.name, 0, sizeof(botMeta.name));
    size_t copyLength = strlen(BOT_NAME) < WSMBT_BOT_MAX_NAME_LEN ? strlen(BOT_NAME) : WSMBT_BOT_MAX_NAME_LEN;
    memcpy(botMeta.name, BOT_NAME, copyLength);

    botMeta.version[0] = BOT_VERSION[0];
    botMeta.version[1] = BOT_VERSION[1];
    botMeta.version[2] = BOT_VERSION[2];

    botMeta.ready = true;

    return botMeta;
}
