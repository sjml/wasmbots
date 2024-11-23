#include <string.h>
#include <stdint.h>
#include <stdbool.h>

#include "wasmbot_client/client.h"

const char* BOT_NAME = "randBounce C";
const uint16_t BOT_VERSION[3] = {0, 3, 0};

WasmBots_Direction _currentDir = WasmBots_Direction_East;

void chooseNewDirection(bool allowRepeat) {
	WasmBots_Direction oldDir = _currentDir;
	int32_t randomDir = wsmbt_getRandomInt(0, 3);
	randomDir *= 2;
	if (!allowRepeat && randomDir == oldDir) {
		randomDir = (randomDir + 2) % 8;
	}
	_currentDir = (WasmBots_Direction)randomDir;
}

void directionToDelta(WasmBots_Direction dir, int16_t* dx, int16_t* dy) {
	*dx = 0;
	*dy = 0;
	switch (dir) {
		case WasmBots_Direction_North:
			*dy = -1;
			break;
		case WasmBots_Direction_East:
			*dx = 1;
			break;
		case WasmBots_Direction_South:
			*dy = 1;
			break;
		case WasmBots_Direction_West:
			*dx = -1;
			break;
		default:
			wsmbt_logfErr("Invalid direction, %d", _currentDir);
			break;
	}
}

WasmBots_TileType getNeighborTile(WasmBots_Direction dir, WasmBots_PresentCircumstances* circumstances) {
	int16_t dx = 0;
	int16_t dy = 0;
	directionToDelta(dir, &dx, &dy);

	const size_t targetIdx = (circumstances->surroundingsRadius + dy) * (circumstances->surroundingsRadius*2+1) + (circumstances->surroundingsRadius + dx);
	return circumstances->surroundings[targetIdx];
}

void* clientTick(WasmBots_PresentCircumstances* circumstances) {
	if (!(circumstances->lastMoveResult == WasmBots_MoveResult_Succeeded)) {
		chooseNewDirection(false);
		// wsmbt_logf("choosing new direction: %d", _currentDir);
	}

	WasmBots_TileType neighbors[4] = {
		getNeighborTile(WasmBots_Direction_North, circumstances),
		getNeighborTile(WasmBots_Direction_East, circumstances),
		getNeighborTile(WasmBots_Direction_South, circumstances),
		getNeighborTile(WasmBots_Direction_West, circumstances),
	};

	// "southeast" == invalid, and not because of any geographical bias of mine
	uint8_t doorCount = 0;
	WasmBots_Direction doors[4] = {
		WasmBots_Direction_Southeast,
		WasmBots_Direction_Southeast,
		WasmBots_Direction_Southeast,
		WasmBots_Direction_Southeast,
	};
	bool isOpened[4] = { false, false, false, false };

	if (neighbors[0] == WasmBots_TileType_OpenDoor || neighbors[0] == WasmBots_TileType_ClosedDoor) {
		if (neighbors[0] == WasmBots_TileType_OpenDoor) {
			isOpened[doorCount] = true;
		}
		doors[doorCount] = WasmBots_Direction_North;
		doorCount++;
	}
	if (neighbors[1] == WasmBots_TileType_OpenDoor || neighbors[1] == WasmBots_TileType_ClosedDoor) {
		if (neighbors[1] == WasmBots_TileType_OpenDoor) {
			isOpened[doorCount] = true;
		}
		doors[doorCount] = WasmBots_Direction_East;
		doorCount++;
	}
	if (neighbors[2] == WasmBots_TileType_OpenDoor || neighbors[2] == WasmBots_TileType_ClosedDoor) {
		if (neighbors[2] == WasmBots_TileType_OpenDoor) {
			isOpened[doorCount] = true;
		}
		doors[doorCount] = WasmBots_Direction_South;
		doorCount++;
	}
	if (neighbors[3] == WasmBots_TileType_OpenDoor || neighbors[3] == WasmBots_TileType_ClosedDoor) {
		if (neighbors[3] == WasmBots_TileType_OpenDoor) {
			isOpened[doorCount] = true;
		}
		doors[doorCount] = WasmBots_Direction_West;
		doorCount++;
	}

	for (uint8_t d = 0; d < doorCount; d++) {
		if (isOpened[d]) {
			if (wsmbt_getRandomInt(0, 4) == 0) {
				wsmbt_log("taking open door");
				_currentDir = doors[d];
				break;
			}
		}
		else {
			if (wsmbt_getRandomInt(0, 3) < 2) {
				_currentDir = doors[d];
				wsmbt_log("opening door");
				WasmBots_Open* open = WasmBots_Open_Create();
				directionToDelta(_currentDir, &open->target.x, &open->target.y);
				return (void*)open;
			}
		}
	}

	WasmBots_MoveTo* move = WasmBots_MoveTo_Create();
	move->direction = _currentDir;
	move->distance = 1;
	return (void*)move;
}

bool clientReceiveGameParams(WasmBots_InitialParameters* initParams) {
	chooseNewDirection(true);
	return true;
}


wsmbt_BotMetadata clientSetup(void) {
	wsmbt_registerTickCallback(&clientTick);

	wsmbt_BotMetadata botMeta;

	memset(botMeta.name, 0, sizeof(botMeta.name));
	size_t copyLength = strlen(BOT_NAME) < WSMBT_BOT_MAX_NAME_LEN ? strlen(BOT_NAME) : WSMBT_BOT_MAX_NAME_LEN;
	memcpy(botMeta.name, BOT_NAME, copyLength);

	botMeta.version[0] = BOT_VERSION[0];
	botMeta.version[1] = BOT_VERSION[1];
	botMeta.version[2] = BOT_VERSION[2];

	return botMeta;
}
