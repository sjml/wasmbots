#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdarg.h>

#include "wasmbot_client.h"

const char* BOT_NAME = "randBounce C";
const uint16_t BOT_VERSION[3] = {0, 2, 0};

typedef enum {
    DIR_EAST, DIR_SOUTHEAST, DIR_SOUTH, DIR_SOUTHWEST, DIR_WEST, DIR_NORTHWEST, DIR_NORTH, DIR_NORTHEAST
} Direction;
Direction CURRENT_DIR = DIR_EAST;

void chooseNewDirection(bool allowRepeat) {
    Direction oldDir = CURRENT_DIR;
    int32_t randomDir = wsmbt_getRandomInt(0, 8);
    if (!allowRepeat && randomDir == oldDir) {
        randomDir = (randomDir + 1) % 8;
    }
    CURRENT_DIR = randomDir;
}

void* clientTick(WasmBotsMessage_GameCircumstances* circumstances) {
    if (!circumstances->lastMoveSucceeded) {
        chooseNewDirection(false);
        wsmbt_logf("choosing new direction: %d", CURRENT_DIR);
    }

    WasmBotsMessage_Move* move = WasmBotsMessage_Move_Create();
    move->direction = (uint8_t)CURRENT_DIR;
    move->distance = 1;

    return (void*)move;
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

    chooseNewDirection(true);

    botMeta.ready = true;

    return botMeta;
}
