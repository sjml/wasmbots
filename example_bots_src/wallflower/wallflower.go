package main

import (
	"fmt"
	"wasmbot_client"
)

//export clientInitialize
func ClientInit() {
	wasmbot_client.RegisterClientSetup(clientSetup)
	wasmbot_client.RegisterClientReceiveGameParams(receiveGameParams)
	wasmbot_client.RegisterTickCallback(tick)
}

func clientSetup() wasmbot_client.BotMetadata {
	return wasmbot_client.BotMetadata{
		Name:    "wallflower",
		Version: [3]uint16{0, 1, 0},
	}
}

func receiveGameParams(_ wasmbot_client.InitialParameters) bool {
	return true // just happy to be here
}

var currentDirection wasmbot_client.Direction
var currentPosition Point
var seekingWall bool = true
var firstTurn bool = true
var startDirection wasmbot_client.Direction
var startPosition Point
var huggingTurns int

//	wall-hugging turn
//	peek to my right:
//		closed door: open it
//		floor or open door: turn right, move forward
//		wall: peek ahead:
//			closed door: open it
//			floor or open door: move forward
//			wall: peek left:
//				closed door: turn left, open it
//				floor or open door: turn left, move forward
//				wall: turn around 180, move forward

func tick(pc wasmbot_client.PresentCircumstances) wasmbot_client.Message {
	if firstTurn {
		firstTurn = false
		currentDirection = wasmbot_client.Direction((wasmbot_client.GetRandomInt(0, 3) * 2) % 8)
		currentPosition = Point{x: 0, y: 0}
		wasmbot_client.Log(fmt.Sprintf("picking initial direction: %d", currentDirection))
	}

	sideLen := int(pc.SurroundingsRadius*2 + 1)
	grid := NewGrid(pc.Surroundings, sideLen, sideLen)
	origin := Point{x: int16(pc.SurroundingsRadius), y: int16(pc.SurroundingsRadius)}

	if seekingWall {
		delta := MOVEMENT[currentDirection]
		peekAhead := grid.GetFromOrigin(origin, delta)
		if peekAhead == wasmbot_client.TileTypeFloor {
			currentPosition = currentPosition.Add(MOVEMENT[currentDirection])
			return wasmbot_client.MoveTo{Direction: currentDirection, Distance: 1}
		}
		wasmbot_client.Log(fmt.Sprintf("found wall at %d,%d", currentPosition.x, currentPosition.y))
		currentDirection = (currentDirection - 2) % 8
		startPosition = currentPosition
		startDirection = currentDirection
		huggingTurns = 0
		seekingWall = false
	}

	// > 1 because if you first encountered a door you'll still be standing there after you open it
	if huggingTurns > 1 && currentDirection == startDirection && currentPosition.Equals(startPosition) {
		wasmbot_client.Log(fmt.Sprintf("returned to original position after %d moves", huggingTurns))
		// return wasmbot_client.Resign{}
	}

	huggingTurns += 1

	rightDir := (currentDirection + 2) % 8
	rightDelta := MOVEMENT[rightDir]
	peekRight := grid.GetFromOrigin(origin, rightDelta)
	if peekRight == wasmbot_client.TileTypeClosedDoor {
		return wasmbot_client.Open{Target: rightDelta.ToMsgPt()}
	}
	if peekRight == wasmbot_client.TileTypeOpenDoor || peekRight == wasmbot_client.TileTypeFloor {
		currentDirection = rightDir
		currentPosition = currentPosition.Add(MOVEMENT[currentDirection])
		return wasmbot_client.MoveTo{Direction: currentDirection, Distance: 1}
	}
	if peekRight == wasmbot_client.TileTypeWall {
		delta := MOVEMENT[currentDirection]
		peekAhead := grid.GetFromOrigin(origin, delta)
		if peekAhead == wasmbot_client.TileTypeClosedDoor {
			return wasmbot_client.Open{Target: delta.ToMsgPt()}
		}
		if peekAhead == wasmbot_client.TileTypeOpenDoor || peekAhead == wasmbot_client.TileTypeFloor {
			currentPosition = currentPosition.Add(MOVEMENT[currentDirection])
			return wasmbot_client.MoveTo{Direction: currentDirection, Distance: 1}
		}
		if peekAhead == wasmbot_client.TileTypeWall {
			leftDir := (currentDirection - 2) % 8
			leftDelta := MOVEMENT[leftDir]
			peekLeft := grid.GetFromOrigin(origin, leftDelta)
			if peekLeft == wasmbot_client.TileTypeClosedDoor {
				currentDirection = leftDir
				return wasmbot_client.Open{Target: leftDelta.ToMsgPt()}
			}
			if peekLeft == wasmbot_client.TileTypeOpenDoor || peekLeft == wasmbot_client.TileTypeFloor {
				currentDirection = leftDir
				currentPosition = currentPosition.Add(MOVEMENT[currentDirection])
				return wasmbot_client.MoveTo{Direction: currentDirection, Distance: 1}
			}
			if peekLeft == wasmbot_client.TileTypeWall {
				currentDirection = (currentDirection + 4) % 8
				currentPosition = currentPosition.Add(MOVEMENT[currentDirection])
				return wasmbot_client.MoveTo{Direction: currentDirection, Distance: 1}
			}
		}
	}

	wasmbot_client.LogErr("couldn't find a move; shouldn't be here")
	return wasmbot_client.NewResignDefault()
}
