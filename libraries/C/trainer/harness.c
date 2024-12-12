#include "harness.h"

#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <stdio.h>
#include <stdbool.h>

extern void clientInitialize(void);
extern size_t setup(size_t);
extern bool receiveGameParams(size_t);
extern void tick(size_t);

static uint8_t* _hostReservePtr = NULL;
static size_t _hostReserveLen = 0;

// (seeded in the simulateSetup)
// yes, there are many better RNGs, but this will do for our purposes
int32_t getRandomInt(int32_t min, int32_t max) {
	return rand() % (max - min) + min;
}

void logFunction(int32_t logLevel, size_t msgPtr, size_t msgLen) {
	const char* msg = (const char*)msgPtr;
	if (msg[msgLen] != '\0') {
		// not null-terminated
		char* buffer = (char*)malloc(msgLen + 1);
		if (!buffer) {
			fprintf(stderr, "Could not allocate log memory\n");
			return;
		}
		memcpy(buffer, msg, msgLen);
		buffer[msgLen] = '\0';
		if (logLevel == 0) {
			fprintf(stderr, "%s\n", buffer);
		} else {
			printf("%s\n", buffer);
		}
		free(buffer);
	}
	else {
		if (logLevel == 0) {
			fprintf(stderr, "%s\n", msg);
		}
		else {
			printf("%s\n", msg);
		}
	}
}

void harness_log(const char* msg) {
	logFunction(2, (size_t)msg, strlen(msg));
}

void harness_logErr(const char* msg) {
	logFunction(0, (size_t)msg, strlen(msg));
}

uint8_t* simulateSetup(size_t reserveRequest) {
	srand(time(NULL));

	const size_t reserveOffset = setup(reserveRequest);
	if (reserveOffset == 0) {
		harness_logErr("Could not allocate reserve memory");
		return NULL;
	}

	_hostReservePtr = (uint8_t*)reserveOffset;
	_hostReserveLen = reserveRequest;

	return _hostReservePtr;
}

uint8_t* simulateReceiveGameParams(uint8_t* incomingBlock, size_t offset) {
	memcpy(_hostReservePtr, incomingBlock, _hostReserveLen);

	bool botReady = receiveGameParams(offset);

	if (!botReady) {
		harness_logErr("Bot declined game parameters");
		return NULL;
	}

	return _hostReservePtr;
}

uint8_t* simulateTick(uint8_t* incomingBlock, size_t offset) {
	memcpy(_hostReservePtr, incomingBlock, _hostReserveLen);

	tick(offset);

	return _hostReservePtr;
}
