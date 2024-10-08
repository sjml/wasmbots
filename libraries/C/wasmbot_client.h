#ifndef WSMBTCLNT_H
#define WSMBTCLNT_H

#include <stdint.h>
#include <stdlib.h>

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

const char* wsmbtclnt_read_string(size_t offset, size_t len);
uint8_t wsmbtclnt_read_u8(size_t offset);
int8_t wsmbtclnt_read_i8(size_t offset);
uint16_t wsmbtclnt_read_u16(size_t offset);
int16_t wsmbtclnt_read_i16(size_t offset);
uint32_t wsmbtclnt_read_u32(size_t offset);
int32_t wsmbtclnt_read_i32(size_t offset);
uint64_t wsmbtclnt_read_u64(size_t offset);
int64_t wsmbtclnt_read_i64(size_t offset);

typedef struct wsmbtclnt_GameParameters {
    uint16_t paramsVersion;
    uint16_t engineVersion[3];
} wsmbtclnt_GameParameters;

typedef void (*wsmbtclnt_TickFunction)();
void wsmbtclnt_setTickCallback(wsmbtclnt_TickFunction tickFunc);

#endif // \WSMBTCLNT_H