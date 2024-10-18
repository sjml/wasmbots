#include <string.h>

#include "wasmbot_client.h"

const char* BOT_NAME = "crash_tick";
const uint16_t BOT_VERSION[3] = { 0, 0, 1 };


void clientTick() {
    // no-op
}

wsmbt_BotMetadata clientSetup(wsmbt_GameParameters params) {
    uint32_t* ptr = NULL;
    *ptr = 123456;
    // nothing else matters because the above will crash

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
