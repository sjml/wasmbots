#include <string.h>

#include "wasmbot_client.h"

const char* BOT_NAME = "crash_tick";
const uint16_t BOT_VERSION[3] = { 0, 0, 1 };

// intentionally inefficient fibonacci calculator
uint64_t fib(uint64_t n) {
    if (n < 2) {
        return n;
    }
    else {
        return fib(n-2) + fib(n-1);
    }
}

void clientTick() {
    // will overrun the tick timeout
    fib(52);
}

wsmbt_BotMetadata clientSetup(wsmbt_GameParameters params) {
    wsmbt_setTickCallback(&clientTick);

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
