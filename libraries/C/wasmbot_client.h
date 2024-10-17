#ifndef WSMBTCLNT_H
#define WSMBTCLNT_H

#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

// should hold true on the vast majority of modern platforms,
//   but if you're on something unusual, check this
typedef float float32_t;
typedef double float64_t;

void wsmbtclnt_log(const char* msg);
void wsmbtclnt_logErr(const char* msg);
void wsmbtclnt_logf(const char* fmt, ...);
void wsmbtclnt_logfErr(const char* fmt, ...);

size_t wsmbtclnt_write_string(size_t offset, char* str);
size_t wsmbtclnt_write_u8(size_t offset, uint8_t value);
size_t wsmbtclnt_write_i8(size_t offset, int8_t value);
size_t wsmbtclnt_write_u16(size_t offset, uint16_t value);
size_t wsmbtclnt_write_i16(size_t offset, int16_t value);
size_t wsmbtclnt_write_u32(size_t offset, uint32_t value);
size_t wsmbtclnt_write_i32(size_t offset, int32_t value);
size_t wsmbtclnt_write_u64(size_t offset, uint64_t value);
size_t wsmbtclnt_write_i64(size_t offset, int64_t value);
size_t wsmbtclnt_write_f32(size_t offset, float32_t value);
size_t wsmbtclnt_write_f64(size_t offset, float64_t value);

const char* wsmbtclnt_read_string(size_t offset, size_t len);
uint8_t wsmbtclnt_read_u8(size_t offset);
int8_t wsmbtclnt_read_i8(size_t offset);
uint16_t wsmbtclnt_read_u16(size_t offset);
int16_t wsmbtclnt_read_i16(size_t offset);
uint32_t wsmbtclnt_read_u32(size_t offset);
int32_t wsmbtclnt_read_i32(size_t offset);
uint64_t wsmbtclnt_read_u64(size_t offset);
int64_t wsmbtclnt_read_i64(size_t offset);
float32_t wsbtclnt_read_f32(size_t offset);
float64_t wsbtclnt_read_f64(size_t offset);

typedef struct wsmbtclnt_GameParameters {
    uint16_t paramsVersion;
    uint16_t engineVersion[3];
} wsmbtclnt_GameParameters;

#define WSMBTCLNT_MAX_BOT_NAME_LEN 26

typedef struct wsmbtclnt_BotMetadata {
    char name[WSMBTCLNT_MAX_BOT_NAME_LEN];
    uint16_t botVersion[3];
    bool ready;
} wsmbtclnt_BotMetadata;

typedef void (*wsmbtclnt_TickFunction)();
void wsmbtclnt_setTickCallback(wsmbtclnt_TickFunction tickFunc);

#endif // \WSMBTCLNT_H
