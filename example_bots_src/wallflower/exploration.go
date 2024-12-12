package main

import (
	"fmt"
	"math"
	"wasmbot_client"
)

type Point struct {
	x int16
	y int16
}

var MOVEMENT = [8]Point{
	{x: 0, y: -1},  // North
	{x: 1, y: -1},  // Northeast
	{x: 1, y: 0},   // East
	{x: 1, y: 1},   // Southeast
	{x: 0, y: 1},   // South
	{x: -1, y: 1},  // Southwest
	{x: -1, y: 0},  // West
	{x: -1, y: -1}, // Northwest
}

func (p Point) Hash() uint64 {
	x64 := uint64(p.x)
	y64 := uint64(p.y)
	return x64*31 + y64
}

func (p Point) ToMsgPt() wasmbot_client.Point {
	return wasmbot_client.Point{X: p.x, Y: p.y}
}

func (p Point) Equals(other Point) bool {
	return p.x == other.x && p.y == other.y
}

func (p Point) Add(other Point) Point {
	return Point{x: p.x + other.x, y: p.y + other.y}
}

func (p Point) Sub(other Point) Point {
	return Point{x: p.x - other.x, y: p.y - other.y}
}

func (p Point) Mul(scale int16) Point {
	return Point{x: p.x * scale, y: p.y * scale}
}

func (p Point) ManhattanDistance(other Point) uint16 {
	dx := int16(math.Abs(float64(other.x - p.x)))
	dy := int16(math.Abs(float64(other.y - p.y)))
	return uint16(dx + dy)
}

func (p Point) DirectionToNeighbor(other Point) (wasmbot_client.Direction, error) {
	delta := p.Sub(other)
	if delta.ManhattanDistance(Point{x: 0, y: 0}) > 1 {
		return 0, fmt.Errorf("Point too far!")
	}

	switch delta {
	case Point{x: 1, y: 0}:
		return wasmbot_client.DirectionEast, nil
	case Point{x: 1, y: 1}:
		return wasmbot_client.DirectionSoutheast, nil
	case Point{x: 0, y: 1}:
		return wasmbot_client.DirectionSouth, nil
	case Point{x: -1, y: 1}:
		return wasmbot_client.DirectionSouthwest, nil
	case Point{x: -1, y: 0}:
		return wasmbot_client.DirectionWest, nil
	case Point{x: -1, y: -1}:
		return wasmbot_client.DirectionNorthwest, nil
	case Point{x: 0, y: -1}:
		return wasmbot_client.DirectionNorth, nil
	case Point{x: 1, y: -1}:
		return wasmbot_client.DirectionNortheast, nil
	default:
		return 0, fmt.Errorf("invalid direction")
	}
}

func (p Point) GetNeighbors4() [4]Point {
	return [4]Point{
		p.Add(MOVEMENT[wasmbot_client.DirectionNorth]),
		p.Add(MOVEMENT[wasmbot_client.DirectionEast]),
		p.Add(MOVEMENT[wasmbot_client.DirectionSouth]),
		p.Add(MOVEMENT[wasmbot_client.DirectionWest]),
	}
}

func (p Point) GetNeighbors8() [8]Point {
	return [8]Point{
		p.Add(MOVEMENT[wasmbot_client.DirectionNorth]),
		p.Add(MOVEMENT[wasmbot_client.DirectionNortheast]),
		p.Add(MOVEMENT[wasmbot_client.DirectionEast]),
		p.Add(MOVEMENT[wasmbot_client.DirectionSoutheast]),
		p.Add(MOVEMENT[wasmbot_client.DirectionSouth]),
		p.Add(MOVEMENT[wasmbot_client.DirectionSouthwest]),
		p.Add(MOVEMENT[wasmbot_client.DirectionWest]),
		p.Add(MOVEMENT[wasmbot_client.DirectionNorthwest]),
	}
}

type Grid[T any] struct {
	data   []T
	width  int
	height int
}

func NewGrid[T any](data []T, width, height int) *Grid[T] {
	wasmbot_client.Log(fmt.Sprintf("grid: %v", data))
	return &Grid[T]{
		data:   data,
		width:  width,
		height: height,
	}
}

func (g *Grid[T]) Get(x, y int) T {
	idx := y*g.width + x
	if idx >= len(g.data) {
		errMsg := fmt.Sprintf("Bad grid access! (%d, %d)", x, y)
		wasmbot_client.LogErr(errMsg)
		panic(errMsg)
	}
	return g.data[idx]
}

func (g *Grid[T]) GetFromOrigin(origin, offset Point) T {
	x := int(origin.x) + int(offset.x)
	y := int(origin.y) + int(offset.y)
	return g.Get(x, y)
}
