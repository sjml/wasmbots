#define WASMBOTSMESSAGE_IMPLEMENTATION
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


//// RANDOM NUMBERS
extern int32_t getRandomInt(int32_t min, int32_t max);
int32_t wsmbt_getRandomInt(int32_t min, int32_t max) {
    return getRandomInt(min, max);
}
//// \RANDOM NUMBERS


//// MEMORY CREATION + READING AND WRITING
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
//// \MEMORY CREATION + READING AND WRITING


//// GAME PARAMETERS
const uint16_t GP_VERSION = 7;

extern wsmbt_BotMetadata clientSetup(void);
extern bool clientReceiveGameParams(WasmBotsMessage_InitialParameters*);

bool receiveGameParams(size_t offset) {
    wsmbt_GameParameters params;

    WasmBotsMessage_DataAccess da = {
        .buffer = WSMBT_HOST_RESERVE,
        .bufferSize = WSMBT_HOST_RESERVE_SIZE,
        .position = offset,
    };

    WasmBotsMessage_InitialParameters initParams;
    WasmBotsMessage_InitialParameters_FromBytes(&da, &initParams);

    if (initParams.paramsVersion != GP_VERSION) {
        wsmbt_logfErr("CLIENT ERROR: Can't parse GameParams v%d; only prepared for v%d", params.paramsVersion, GP_VERSION);
        return false;
    }

    return clientReceiveGameParams(&initParams);
}
//// \GAME PARAMETERS


//// SETUP AND LOOP
WasmBotsMessage_DataAccess _dataAccess;

size_t setup(size_t requestReserve) {
    if (!_reserveMemory(requestReserve)) {
        return 0;
    }

    _dataAccess.buffer = WSMBT_HOST_RESERVE;
    _dataAccess.bufferSize = requestReserve;
    _dataAccess.position = 0;

    const wsmbt_BotMetadata botData = clientSetup();

    memcpy((char*)(WSMBT_HOST_RESERVE), botData.name, WSMBT_BOT_MAX_NAME_LEN);

    _dataAccess.position = WSMBT_BOT_MAX_NAME_LEN;
    WasmBotsMessage__WriteUInt16(&_dataAccess, botData.version[0]);
    WasmBotsMessage__WriteUInt16(&_dataAccess, botData.version[1]);
    WasmBotsMessage__WriteUInt16(&_dataAccess, botData.version[2]);

    return (size_t)WSMBT_HOST_RESERVE;
}

void* _noop(WasmBotsMessage_PresentCircumstances* circumstances) { return NULL; }
wsmbt_TickFunction _clientTick = &_noop;

void wsmbt_registerTickCallback(wsmbt_TickFunction tickFunc) {
    _clientTick = tickFunc;
}

void tick(size_t offset) {
    WasmBotsMessage_err_t err = WASMBOTSMESSAGE_ERR_OK;
    void* playerMove = NULL;

    _dataAccess.position = offset;
    WasmBotsMessage_PresentCircumstances* circumstances = malloc(sizeof(WasmBotsMessage_PresentCircumstances));
    err = WasmBotsMessage_PresentCircumstances_FromBytes(&_dataAccess, circumstances);
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        WasmBotsMessage_PresentCircumstances_Destroy(circumstances);
        WasmBotsMessage__Error* errMsg = WasmBotsMessage__Error_Create();
        errMsg->description = "Could not read PresentCircumstances message";
        errMsg->description_len = strlen(errMsg->description);
        wsmbt_logErr(errMsg->description);
        playerMove = errMsg;
    }
    else {
        playerMove = _clientTick(circumstances);
    }

    if (playerMove != NULL) {
        _dataAccess.position = 0;
        err = WasmBotsMessage_WriteBytes(&_dataAccess, playerMove, true);
        err = WasmBotsMessage_Destroy(playerMove);
    }

    WasmBotsMessage_PresentCircumstances_Destroy(circumstances);
}
//// \SETUP AND LOOP
