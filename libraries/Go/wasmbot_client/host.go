//go:build tinygo

package wasmbot_client

//go:wasmimport env logFunction
func HostLogFunction(logLevel int32, msgPtr uintptr, msgLen uintptr)

//go:wasmimport env getRandomInt
func GetRandomInt(min int32, max int32) int32
