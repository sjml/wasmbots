package main

import (
	"fmt"
	"wasmbot_client"
)

//export clientInitialize
func init() {
	wasmbot_client.RegisterClientSetup(clientSetup)
	wasmbot_client.RegisterTickCallback(tick)
}

func clientSetup(params wasmbot_client.GameParameters) wasmbot_client.BotMetadata {
	botMeta := wasmbot_client.BotMetadata{
		Name:    "bot_go",
		Version: [3]uint16{0, 1, 0},
		Ready:   true,
	}

	wasmbot_client.Log("Good to go!")
	return botMeta
}

var CURRENT_FIB uint64 = 35

func tick(lastDuration uint32) {
	if lastDuration < 250 {
		CURRENT_FIB += 1
		wasmbot_client.Log(fmt.Sprintf("Incrementing fib to %d", CURRENT_FIB))
	}
	fib(CURRENT_FIB)
}

// intentionally inefficient fibonacci calculator
func fib(n uint64) uint64 {
	if n < 2 {
		return n
	} else {
		return fib(n-2) + fib(n-1)
	}
}
