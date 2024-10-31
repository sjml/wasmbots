#ifndef WASMBOT_CLIENT_H
#define WASMBOT_CLIENT_H

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#include "./wasmbot_messages.h"

// should hold true on the vast majority of modern platforms,
//   but if you're on something unusual, check this
typedef float float32_t;
typedef double float64_t;

int32_t wsmbt_getRandomInt(int32_t min, int32_t max);

void wsmbt_log(const char* msg);
void wsmbt_logErr(const char* msg);
void wsmbt_logf(const char* fmt, ...);
void wsmbt_logfErr(const char* fmt, ...);

typedef struct wsmbt_GameParameters {
    uint16_t paramsVersion;
    uint16_t engineVersion[3];
} wsmbt_GameParameters;

#define WSMBT_BOT_MAX_NAME_LEN 26

typedef struct wsmbt_BotMetadata {
    char name[WSMBT_BOT_MAX_NAME_LEN];
    uint16_t version[3];
    bool ready;
} wsmbt_BotMetadata;

typedef void* (*wsmbt_TickFunction)(WasmBotsMessage_PresentCircumstances*);
void wsmbt_registerTickCallback(wsmbt_TickFunction tickFunc);

#endif // \WASMBOT_CLIENT_H
