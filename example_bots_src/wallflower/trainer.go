//go:build trainer

// just a shim that hooks us up to the trainer

package main

import (
	"wasmbot_client"
	"wasmbot_trainer"
)

func main() {
	impl := wasmbot_trainer.BotImplementation{
		ClientInitializeFunc:     ClientInit,
		SetupFunc:                wasmbot_client.Setup,
		ReceiveGameParamsFunc:    wasmbot_client.ReceiveGameParams,
		TickFunc:                 wasmbot_client.Tick,
		HostLogFunction:          &wasmbot_client.HostLogFunction,
		HostGetRandomIntFunction: &wasmbot_client.GetRandomInt,
	}

	wasmbot_trainer.TrainerMain(impl)
}
