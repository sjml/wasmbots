#include "./wasmbot_client.h"

#include <stdarg.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>


//// LOGGING
extern void logFunction(int logLevel, unsigned int msgPtr, unsigned int msgLen);

void wsmbtclnt_log(const char* msg) {
    logFunction(2, (size_t)msg, strlen(msg));
}

void wsmbtclnt_logErr(const char* msg) {
    logFunction(0, (size_t)msg, strlen(msg));
}

void wsmbtclnt_logf(const char* fmt, ...) {
    va_list argptr;
    va_start(argptr, fmt);
    size_t buffSizeNeeded = vsnprintf(NULL, 0, fmt, argptr);
    va_end(argptr);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    va_start(argptr, fmt);
    vsprintf(msgBuffer, fmt, argptr);
    va_end(argptr);

    wsmbtclnt_log(msgBuffer);
    free(msgBuffer);
}

void wsmbtclnt_logfErr(const char* fmt, ...) {
    va_list argptr;
    va_start(argptr, fmt);
    size_t buffSizeNeeded = vsnprintf(NULL, 0, fmt, argptr);
    va_end(argptr);
    char* msgBuffer = malloc(buffSizeNeeded+1);
    va_start(argptr, fmt);
    vsprintf(msgBuffer, fmt, argptr);
    va_end(argptr);

    wsmbtclnt_logErr(msgBuffer);
    free(msgBuffer);
}
//// \LOGGING


//// MEMORY CREATION + READING AND WRITING
#if !defined(WSMBTCLNT_BOUNDS_CHECKING)
    #define WSMBTCLNT_BOUNDS_CHECKING 1
#endif
#if !defined(WSMBTCLNT_DEV_BIG_ENDIAN)
    #define WSMBTCLNT_DEV_BIG_ENDIAN 0
#endif

uint8_t* WSMBTCLNT_HOST_RESERVE = NULL;
size_t WSMBTCLNT_HOST_RESERVE_SIZE = 0;

bool _reserveMemory(size_t request) {
    if (WSMBTCLNT_HOST_RESERVE != NULL) {
        wsmbtclnt_logErr("CLIENT ERROR: Attempting to reserve memory twice");
        return false;
    }
    WSMBTCLNT_HOST_RESERVE = malloc(request);
    if (WSMBTCLNT_HOST_RESERVE == NULL) {
        wsmbtclnt_logErr("CLIENT ERROR: Could not allocate reserve memory");
        return false;
    }
    WSMBTCLNT_HOST_RESERVE_SIZE = request;
    return true;
}

size_t wsmbtclnt_write_string(size_t offset, char* str) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    size_t str_len = strlen(str);
    if (offset + str_len >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: String too long to write to reserve memory");
        return offset;
    }
    #else
    size_t str_len = 0;
    #endif

    while (*str != 0) {
        WSMBTCLNT_HOST_RESERVE[offset++] = *str++;
        #if !WSMBTCLNT_BOUNDS_CHECKING
        str_len++;
        #endif
    }

    return str_len;
}

size_t wsmbtclnt_write_u8(size_t offset, uint8_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing uint8_t outside of reserve memory");
        return offset;
    }
    #endif
    WSMBTCLNT_HOST_RESERVE[offset] = value;
    return offset + 1;
}

size_t wsmbtclnt_write_i8(size_t offset, int8_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing uint8_t outside of reserve memory");
        return offset;
    }
    #endif
    WSMBTCLNT_HOST_RESERVE[offset] = value;
    return offset + 1;
}

size_t wsmbtclnt_write_u16(size_t offset, uint16_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing uint16_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbtclnt_write_i16(size_t offset, int16_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing int16_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbtclnt_write_u32(size_t offset, uint32_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing uint32_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbtclnt_write_i32(size_t offset, int32_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing int32_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbtclnt_write_u64(size_t offset, uint64_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing uint64_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}

size_t wsmbtclnt_write_i64(size_t offset, int64_t value) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(value) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: Writing int64_t outside of reserve memory");
        return offset;
    }
    #endif

    for (size_t i = 0; i < sizeof(value); i++) {
        WSMBTCLNT_HOST_RESERVE[offset + i] = (value >> (i * 8)) & 0xFF;
    }

    return offset + sizeof(value);
}


const char* wsmbtclnt_read_string(size_t offset, size_t len) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + len >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: String read will overrun reserve memory");
        return NULL;
    }
    #endif

    char* str = malloc(len + 1);
    if (str == NULL) {
        wsmbtclnt_logErr("CLIENT_ERROR: String memory allocation failed");
        return NULL;
    }

    for (size_t i=0; i < len; i++) {
        str[i] = WSMBTCLNT_HOST_RESERVE[offset + i];
    }
    str[len] = '\0';
    return str;
}

uint8_t wsmbtclnt_read_u8(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: uint8_tt read will overrun reserve memory");
        return 0;
    }
    #endif
    return WSMBTCLNT_HOST_RESERVE[offset];
}

int8_t wsmbtclnt_read_i8(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: int8_t read will overrun reserve memory");
        return 0;
    }
    #endif
    return (int8_t)WSMBTCLNT_HOST_RESERVE[offset];
}

uint16_t wsmbtclnt_read_u16(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(uint16_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: uint16_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint16_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(uint16_t); i++) {
        value |= (uint16_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(uint16_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int16_t wsmbtclnt_read_i16(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(int16_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: int16_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int16_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(int16_t); i++) {
        value |= (int16_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(int16_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

uint32_t wsmbtclnt_read_u32(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(uint32_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: uint32_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint32_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(uint32_t); i++) {
        value |= (uint32_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(uint32_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int32_t wsmbtclnt_read_i32(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(int32_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: int32_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int32_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(int32_t); i++) {
        value |= (int32_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(int32_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

uint64_t wsmbtclnt_read_u64(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(uint64_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: uint64_t read will overrun reserve memory");
        return 0;
    }
    #endif

    uint64_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(uint64_t); i++) {
        value |= (uint64_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(uint64_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}

int64_t wsmbtclnt_read_i64(size_t offset) {
    #if WSMBTCLNT_BOUNDS_CHECKING
    if (offset + sizeof(int64_t) >= WSMBTCLNT_HOST_RESERVE_SIZE) {
        wsmbtclnt_logErr("CLIENT_ERROR: int64_t read will overrun reserve memory");
        return 0;
    }
    #endif

    int64_t value = 0;
    #if !WSMBTCLNT_DEV_BIG_ENDIAN
    memcpy(&value, &WSMBTCLNT_HOST_RESERVE[offset], sizeof(value));
    #else
    for (size_t i = 0; i < sizeof(int64_t); i++) {
        value |= (int64_t)WSMBTCLNT_HOST_RESERVE[offset + (sizeof(int64_t) - 1 - i)] << (i * 8);
    }
    #endif
    return value;
}
//// \MEMORY CREATION + READING AND WRITING


//// GAME PARAMETERS
const uint16_t GP_VERSION = 7;

extern wsmbtclnt_BotMetadata clientSetup(wsmbtclnt_GameParameters params);

bool receiveGameParams(size_t offset, size_t infoOffset) {
    wsmbtclnt_GameParameters params;

    params.paramsVersion = wsmbtclnt_read_u16(offset);
    offset += sizeof(uint16_t);
    if (params.paramsVersion != GP_VERSION) {
        wsmbtclnt_logfErr("CLIENT ERROR: Can't parse GameParams v%d; only prepared for v%d", params.paramsVersion, GP_VERSION);
        return false;
    }
    params.engineVersion[0] = wsmbtclnt_read_u16(offset);
    offset += sizeof(uint16_t);
    params.engineVersion[1] = wsmbtclnt_read_u16(offset);
    offset += sizeof(uint16_t);
    params.engineVersion[2] = wsmbtclnt_read_u16(offset);
    offset += sizeof(uint16_t);

    const wsmbtclnt_BotMetadata botData = clientSetup(params);
    memcpy((char*)(WSMBTCLNT_HOST_RESERVE + infoOffset), botData.name, WSMBTCLNT_MAX_BOT_NAME_LEN);
    infoOffset += WSMBTCLNT_MAX_BOT_NAME_LEN;
    infoOffset = wsmbtclnt_write_u16(infoOffset, botData.botVersion[0]);
    infoOffset = wsmbtclnt_write_u16(infoOffset, botData.botVersion[1]);
    infoOffset = wsmbtclnt_write_u16(infoOffset, botData.botVersion[2]);
    return botData.ready;
}
//// \GAME PARAMETERS


//// SETUP AND LOOP
size_t setup(size_t requestReserve) {
    if (!_reserveMemory(requestReserve)) {
        return 0;
    }

    return (size_t)WSMBTCLNT_HOST_RESERVE;
}

wsmbtclnt_TickFunction _clientTick = NULL;

void wsmbtclnt_setTickCallback(wsmbtclnt_TickFunction tickFunc) {
    if (_clientTick != NULL) {
        wsmbtclnt_logErr("CLIENT ERROR: Tick callback already registered");
    }
    _clientTick = tickFunc;
}

void tick(size_t offset) {
    if (_clientTick != NULL) {
        _clientTick();
    }
}
//// \SETUP AND LOOP
