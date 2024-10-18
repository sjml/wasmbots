package wasmbot_client

import (
	"unsafe"
)

//export logFunction
func hostLogFunction(logLevel int32, msgPtr uintptr, msgLen uint)

func Log(msg string) {
	msgBytes := []byte(msg)
	hostLogFunction(2, uintptr(unsafe.Pointer(&msgBytes[0])), uint(len(msgBytes)))
}

func LogErr(msg string) {
	msgBytes := []byte(msg)
	hostLogFunction(0, uintptr(unsafe.Pointer(&msgBytes[0])), uint(len(msgBytes)))
}

//export setup
func setup(request uintptr) uintptr {
	reserveHostMemory(request)
	return uintptr(unsafe.Pointer(&hostReserve[0]))
}

type TickFunction func()

var clientTick TickFunction = _noop

func _noop() {}

//export tick
func tick(offset uintptr) {
	clientTick()
}

func SetTickCallback(cb TickFunction) {
	clientTick = cb
}
