#pragma once

#include <stdint.h>
#include <stddef.h>

uint8_t* simulateSetup(size_t reserveRequest);
uint8_t* simulateReceiveGameParams(uint8_t* incomingBlock, size_t offset);
uint8_t* simulateTick(uint8_t* incomingBlock, size_t offset);
