package main

import (
	"wasmbot_client"
)

//export clientInitialize
func ClientInit() {
	wasmbot_client.RegisterClientSetup(clientSetup)
	wasmbot_client.RegisterClientReceiveGameParams(receiveGameParams)
	wasmbot_client.RegisterTickCallback(tick)
}

func clientSetup() wasmbot_client.BotMetadata {
	currentDirection = wasmbot_client.DirectionEast
	return wasmbot_client.BotMetadata{
		Name:    "wallflower",
		Version: [3]uint16{0, 1, 0},
	}
}

func receiveGameParams(_ wasmbot_client.InitialParameters) bool {
	return true // just happy to be here
}

var currentDirection wasmbot_client.Direction

func evaluatePosition(tile wasmbot_client.TileType, dir wasmbot_client.Direction, pos Point) (bool, wasmbot_client.Message) {
	switch tile {
	case wasmbot_client.TileTypeClosedDoor:
		return true, wasmbot_client.Open{Target: pos.ToMsgPt()}
	case wasmbot_client.TileTypeOpenDoor, wasmbot_client.TileTypeFloor:
		return true, wasmbot_client.MoveTo{Direction: dir, Distance: 1}
	}
	return false, nil
}

func tick(pc wasmbot_client.PresentCircumstances) wasmbot_client.Message {
	sideLen := int(pc.SurroundingsRadius*2 + 1)
	grid := NewGrid(pc.Surroundings, sideLen, sideLen)
	origin := Point{x: int16(pc.SurroundingsRadius), y: int16(pc.SurroundingsRadius)}

	rightDir := (currentDirection + 2) % 8
	rightDelta := MOVEMENT[rightDir]
	peekRight := grid.GetFromOrigin(origin, rightDelta)
	moving, move := evaluatePosition(peekRight, rightDir, rightDelta)
	if moving {
		currentDirection = rightDir
		return move
	}

	delta := MOVEMENT[currentDirection]
	peekAhead := grid.GetFromOrigin(origin, delta)
	moving, move = evaluatePosition(peekAhead, currentDirection, delta)
	if moving {
		return move
	}

	wasmbot_client.LogErr("couldn't find a move; shouldn't be here")
	return wasmbot_client.NewResignDefault()
}
