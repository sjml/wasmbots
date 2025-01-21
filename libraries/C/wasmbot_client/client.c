#include "./client.h"

#include <stdarg.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>

#define WASMBOTS_IMPLEMENTATION
#include "wasmbot_messages.h"

//// LOGGING
extern void logFunction(int logLevel, unsigned int msgPtr, unsigned int msgLen);

void wsmbt_log(const char* msg) {
	#if !defined(__EMSCRIPTEN__)
		// doing straight pointer casts from potentially read-only memory
		//   is problematic; this is hacky and slightly wasteful
		//   but gets the job done when compiling for native.
		size_t copyLen = strlen(msg) + 1;
		char* copy = malloc(copyLen);
		strlcpy(copy, msg, copyLen);
		logFunction(2, (size_t)copy, copyLen-1);
		free(copy);
	#else
		logFunction(2, (size_t)msg, strlen(msg));
	#endif
}

void wsmbt_logErr(const char* msg) {
	#if !defined(__EMSCRIPTEN__)
		// doing straight pointer casts from potentially read-only memory
		//   is problematic; this is hacky and slightly wasteful
		//   but gets the job done when compiling for native.
		size_t copyLen = strlen(msg) + 1;
		char* copy = malloc(copyLen);
		strlcpy(copy, msg, copyLen);
		logFunction(0, (size_t)copy, copyLen-1);
		free(copy);
	#else
		logFunction(0, (size_t)msg, strlen(msg));
	#endif
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
const uint16_t GP_VERSION = 8;

extern wsmbt_BotMetadata clientSetup(void);
extern bool clientReceiveGameParams(WasmBots_InitialParameters*);

bool receiveGameParams(size_t offset) {
	wsmbt_GameParameters params;

	WasmBots_DataAccess da = {
		.buffer = WSMBT_HOST_RESERVE,
		.bufferSize = WSMBT_HOST_RESERVE_SIZE,
		.position = offset,
	};

	WasmBots_InitialParameters initParams;
	WasmBots_InitialParameters_FromBytes(&da, &initParams);

	if (initParams.paramsVersion != GP_VERSION) {
		wsmbt_logfErr("CLIENT ERROR: Can't parse GameParams v%d; only prepared for v%d", params.paramsVersion, GP_VERSION);
		return false;
	}

	return clientReceiveGameParams(&initParams);
}
//// \GAME PARAMETERS


//// SETUP AND LOOP
WasmBots_DataAccess _dataAccess;

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
	WasmBots__WriteUInt16(&_dataAccess, botData.version[0]);
	WasmBots__WriteUInt16(&_dataAccess, botData.version[1]);
	WasmBots__WriteUInt16(&_dataAccess, botData.version[2]);

	return (size_t)WSMBT_HOST_RESERVE;
}

void* _noop(WasmBots_PresentCircumstances* circumstances) {
	char* errMsg = "No client tick function registered";
	WasmBots__Error* err = WasmBots__Error_Create();
	err->description = errMsg;
	err->description_len = strlen(errMsg);
	return err;
}
wsmbt_TickFunction _clientTick = &_noop;

void wsmbt_registerTickCallback(wsmbt_TickFunction tickFunc) {
	_clientTick = tickFunc;
}

void tick(size_t offset) {
	WasmBots_err_t err = WASMBOTS_ERR_OK;
	void* playerMove = NULL;

	_dataAccess.position = offset;
	WasmBots_PresentCircumstances* circumstances = malloc(sizeof(WasmBots_PresentCircumstances));
	err = WasmBots_PresentCircumstances_FromBytes(&_dataAccess, circumstances);
	if (err != WASMBOTS_ERR_OK) {
		WasmBots_PresentCircumstances_Destroy(circumstances);
		WasmBots__Error* errMsg = WasmBots__Error_Create();
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
		err = WasmBots_WriteBytes(&_dataAccess, playerMove, true);
		err = WasmBots_Destroy(playerMove);
	}

	WasmBots_PresentCircumstances_Destroy(circumstances);
}
//// \SETUP AND LOOP
