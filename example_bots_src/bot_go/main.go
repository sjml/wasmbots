package main

import "wasmbot_client"

//export clientInitialize
func init() {
	wasmbot_client.RegisterClientSetup(clientSetup)
}

func clientSetup(params wasmbot_client.GameParameters) wasmbot_client.BotMetadata {
	wasmbot_client.RegisterTickCallback(tick)

	botMeta := wasmbot_client.BotMetadata{
		Name:    "bot_go",
		Version: [3]uint16{0, 1, 0},
		Ready:   true,
	}

	wasmbot_client.Log("Good to go!")
	return botMeta
}

func tick() {
	fib(40)
}

// intentionally inefficient fibonacci calculator
func fib(n uint64) uint64 {
	if n < 2 {
		return n
	} else {
		return fib(n-2) + fib(n-1)
	}
}
