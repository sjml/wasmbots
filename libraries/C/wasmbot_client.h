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

size_t wsmbt_write_string(size_t offset, char* str);
size_t wsmbt_write_u8(size_t offset, uint8_t value);
size_t wsmbt_write_i8(size_t offset, int8_t value);
size_t wsmbt_write_u16(size_t offset, uint16_t value);
size_t wsmbt_write_i16(size_t offset, int16_t value);
size_t wsmbt_write_u32(size_t offset, uint32_t value);
size_t wsmbt_write_i32(size_t offset, int32_t value);
size_t wsmbt_write_u64(size_t offset, uint64_t value);
size_t wsmbt_write_i64(size_t offset, int64_t value);
size_t wsmbt_write_f32(size_t offset, float32_t value);
size_t wsmbt_write_f64(size_t offset, float64_t value);

const char* wsmbt_read_string(size_t offset, size_t len);
uint8_t wsmbt_read_u8(size_t offset);
int8_t wsmbt_read_i8(size_t offset);
uint16_t wsmbt_read_u16(size_t offset);
int16_t wsmbt_read_i16(size_t offset);
uint32_t wsmbt_read_u32(size_t offset);
int32_t wsmbt_read_i32(size_t offset);
uint64_t wsmbt_read_u64(size_t offset);
int64_t wsmbt_read_i64(size_t offset);
float32_t wsmbt_read_f32(size_t offset);
float64_t wsmbt_read_f64(size_t offset);

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

typedef WasmBotsMessage_PlayerMove* (*wsmbt_TickFunction)(WasmBotsMessage_GameCircumstances*);
void wsmbt_registerTickCallback(wsmbt_TickFunction tickFunc);

#endif // \WASMBOT_CLIENT_H
