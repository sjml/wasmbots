#include "./wasmbot_client.h"

#include <stdarg.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>


//// LOGGING
extern void logFunction(int logLevel, unsigned int msgPtr, unsigned int msgLen);

void wsmbt_log(const char* msg) {
    logFunction(2, (size_t)msg, strlen(msg));
}

void wsmbt_logErr(const char* msg) {
    logFunction(0, (size_t)msg, strlen(msg));
}

void wsmbt_logf(const char* fmt, ...) {
    va_list argptr;
    va_start(argptr, fmt);
    size_t buffSizeNeeded = vsnprintf(NULL, 0, fmt, argptr);
    va_end(argptr);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    va_start(argptr, fmt);
    vsprintf(msgBuffer, fmt, argptr);
    va_end(argptr);

    wsmbt_log(msgBuffer);
    free(msgBuffer);
}

void wsmbt_logfErr(const char* fmt, ...) {
    va_list argptr;
    va_start(argptr, fmt);
    size_t buffSizeNeeded = vsnprintf(NULL, 0, fmt, argptr);
    va_end(argptr);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    va_start(argptr, fmt);
    vsprintf(msgBuffer, fmt, argptr);
    va_end(argptr);

    wsmbt_logErr(msgBuffer);
    free(msgBuffer);
}
//// \LOGGING


//// MEMORY CREATION + READING AND WRITING
#if !defined(WSMBT_BOUNDS_CHECKING)
    #define WSMBT_BOUNDS_CHECKING 1
#endif
#if !defined(WSMBT_DEV_BIG_ENDIAN)
    #define WSMBT_DEV_BIG_ENDIAN 0
#endif

uint8_t* WSMBT_HOST_RESERVE = NULL;
size_t WSMBT_HOST_RESERVE_SIZE = 0;

bool _reserveMemory(size_t request) {
    if (WSMBT_HOST_RESERVE != NULL) {
        wsmbt_logErr("CLIENT ERROR: Attempting to reserve memory twice");
        return false;
    }
    WSMBT_HOST_RESERVE = malloc(request);
    if (WSMBT_HOST_RESERVE == NULL) {
        wsmbt_logErr("CLIENT ERROR: Could not allocate reserve memory");
        return false;
    }
    WSMBT_HOST_RESERVE_SIZE = request;
    return true;
}

size_t wsmbt_write_string(size_t offset, char* str) {
    #if WSMBT_BOUNDS_CHECKING
    size_t str_len = strlen(str);
    if (offset + str_len >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: String too long to write to reserve memory");
        return offset;
    }
    #else
    size_t str_len = 0;
    #endif

    while (*str != 0) {
        WSMBT_HOST_RESERVE[offset++] = *str++;
        #if !WSMBT_BOUNDS_CHECKING
        str_len++;
        #endif
    }

    return str_len;
}

size_t wsmbt_write_u8(size_t offset, uint8_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing uint8_t outside of reserve memory");
        return offset;
    }
    #endif
    WSMBT_HOST_RESERVE[offset] = value;
    return offset + 1;
}

size_t wsmbt_write_i8(size_t offset, int8_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing uint8_t outside of reserve memory");
        return offset;
    }
    #endif
    WSMBT_HOST_RESERVE[offset] = value;
    return offset + 1;
}

size_t wsmbt_write_u16(size_t offset, uint16_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing uint16_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_i16(size_t offset, int16_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing int16_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_u32(size_t offset, uint32_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing uint32_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_i32(size_t offset, int32_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing int32_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_u64(size_t offset, uint64_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing uint64_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_i64(size_t offset, int64_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing int64_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_f32(size_t offset, float32_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing float32_t outside of reserve memory");
        return offset;
    }
    #endif

    uint8_t* valuePunnedPtr = (uint8_t*) &value;
    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = valuePunnedPtr[i];
    }

    return offset + sizeof(value);
}

size_t wsmbt_write_f64(size_t offset, float64_t value) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: Writing float64_t outside of reserve memory");
        return offset;
    }
    #endif

    uint8_t* valuePunnedPtr = (uint8_t*) &value;
    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBT_HOST_RESERVE[offset + i] = valuePunnedPtr[i];
    }

    return offset + sizeof(value);
}


const char* wsmbt_read_string(size_t offset, size_t len) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + len >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: String read will overrun reserve memory");
        return NULL;
    }
    #endif

    char* str = malloc(len + 1);
    if (str == NULL) {
        wsmbt_logErr("CLIENT ERROR: String memory allocation failed");
        return NULL;
    }

    for (size_t i=0; i < len; i++) {
        str[i] = WSMBT_HOST_RESERVE[offset + i];
    }
    str[len] = '\0';
    return str;
}

uint8_t wsmbt_read_u8(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: uint8_t read will overrun reserve memory");
        return 0;
    }
    #endif
    return WSMBT_HOST_RESERVE[offset];
}

int8_t wsmbt_read_i8(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: int8_t read will overrun reserve memory");
        return 0;
    }
    #endif
    return (int8_t)WSMBT_HOST_RESERVE[offset];
}

uint16_t wsmbt_read_u16(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(uint16_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: uint16_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint16_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (uint16_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int16_t wsmbt_read_i16(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(int16_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: int16_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int16_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (int16_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

uint32_t wsmbt_read_u32(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(uint32_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: uint32_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint32_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (uint32_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int32_t wsmbt_read_i32(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(int32_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: int32_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int32_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (int32_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

uint64_t wsmbt_read_u64(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(uint64_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: uint64_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint64_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (uint64_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int64_t wsmbt_read_i64(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(int64_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: int64_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int64_t value = 0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(value); i++) {
        value |= (int64_t)WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

float32_t wsmbt_read_f32(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(float32_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: float32_t read will overrun reserve memory");
        return 0.0f;
    }
    #endif

    float32_t value = 0.0f;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    uint8_t* valuePunnedPtr = (uint8_t*) &value;
    for (size_t i = 0; i < sizeof(value); i++) {
        valuePunnedPtr[i] = WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)];
    }
    #endif
    return value;
}

float64_t wsmbt_read_f64(size_t offset) {
    #if WSMBT_BOUNDS_CHECKING
    if (offset + sizeof(float64_t) >= WSMBT_HOST_RESERVE_SIZE) {
        wsmbt_logErr("CLIENT ERROR: float64_t read will overrun reserve memory");
        return 0.0;
    }
    #endif

    float64_t value = 0.0;
    #if !WSMBT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBT_HOST_RESERVE[offset], sizeof(value));
    #else
    uint8_t* valuePunnedPtr = (uint8_t*) &value;
    for (size_t i = 0; i < sizeof(value); i++) {
        valuePunnedPtr[i] = WSMBT_HOST_RESERVE[offset + (sizeof(value) - 1 - i)];
    }
    #endif
    return value;
}
//// \MEMORY CREATION + READING AND WRITING


//// GAME PARAMETERS
const uint16_t GP_VERSION = 7;

extern wsmbt_BotMetadata clientSetup(wsmbt_GameParameters params);

bool receiveGameParams(size_t offset, size_t infoOffset) {
    wsmbt_GameParameters params;

    params.paramsVersion = wsmbt_read_u16(offset);
    offset += sizeof(uint16_t);
    if (params.paramsVersion != GP_VERSION) {
        wsmbt_logfErr("CLIENT ERROR: Can't parse GameParams v%d; only prepared for v%d", params.paramsVersion, GP_VERSION);
        return false;
    }
    params.engineVersion[0] = wsmbt_read_u16(offset);
    offset += sizeof(uint16_t);
    params.engineVersion[1] = wsmbt_read_u16(offset);
    offset += sizeof(uint16_t);
    params.engineVersion[2] = wsmbt_read_u16(offset);
    offset += sizeof(uint16_t);

    const wsmbt_BotMetadata botData = clientSetup(params);
    memcpy((char*)(WSMBT_HOST_RESERVE + infoOffset), botData.name, WSMBT_BOT_MAX_NAME_LEN);
    infoOffset += WSMBT_BOT_MAX_NAME_LEN;
    infoOffset = wsmbt_write_u16(infoOffset, botData.version[0]);
    infoOffset = wsmbt_write_u16(infoOffset, botData.version[1]);
    infoOffset = wsmbt_write_u16(infoOffset, botData.version[2]);
    return botData.ready;
}
//// \GAME PARAMETERS


//// SETUP AND LOOP
size_t setup(size_t requestReserve) {
    if (!_reserveMemory(requestReserve)) {
        return 0;
    }

    return (size_t)WSMBT_HOST_RESERVE;
}

void _noop() {}
wsmbt_TickFunction _clientTick = &_noop;

void wsmbt_setTickCallback(wsmbt_TickFunction tickFunc) {
    _clientTick = tickFunc;
}

void tick(size_t offset) {
    _clientTick();
}
//// \SETUP AND LOOP
