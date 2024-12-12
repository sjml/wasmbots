package wasmbot_trainer

import (
	"errors"
	"fmt"
	"math/rand"
	"os"
	"unicode/utf8"
	"unsafe"
)

var hostReservePtr unsafe.Pointer
var hostReserveLen int

func setupHarness() bool {
	if CHATTY_SERVER {
		fmt.Print("Setting up harness...\n")
	}

	*botImpl.HostLogFunction = logger
	*botImpl.HostGetRandomIntFunction = randomInt

	return true
}

func logger(logLevel int32, msgPtr uintptr, msgLen uintptr) {
	str, err := liftString(msgPtr, msgLen)
	if err != nil {
		errMsg := "Could not parse valid UTF-8 out of string pointer"
		fmt.Fprintf(os.Stderr, errMsg)
		return
	}
	writer := os.Stdout
	if logLevel == 0 {
		writer = os.Stderr
	}
	fmt.Fprintf(writer, "%s\n", str)
}

func liftString(msgPtr uintptr, msgLen uintptr) (string, error) {
	rawSlice := unsafe.Slice((*byte)(unsafe.Pointer(msgPtr)), msgLen)

	if !utf8.Valid(rawSlice) {
		return "", errors.New("invalid utf-8")
	}
	return string(rawSlice), nil
}

func randomInt(min int32, max int32) int32 {
	if max <= min {
		return min
	}
	return rand.Int31n(max-min) + min
}

func simulateSetup(reserveRequest uintptr) uintptr {
	botImpl.ClientInitializeFunc()

	reservePtr := botImpl.SetupFunc(reserveRequest)
	hostReservePtr = unsafe.Pointer(reservePtr)
	hostReserveLen = int(reserveRequest)

	return reservePtr
}

func simulateReceiveGameParams(incomingBlock []byte, offset uintptr) []byte {
	rawSlice := unsafe.Slice((*byte)(hostReservePtr), hostReserveLen)
	copy(rawSlice, incomingBlock)

	botReady := botImpl.ReceiveGameParamsFunc(offset)

	if !botReady {
		fmt.Fprintln(os.Stderr, "Bot declined game parameters")
		return nil
	}

	return rawSlice
}

func simulateTick(incomingBlock []byte, offset uintptr) []byte {
	rawSlice := unsafe.Slice((*byte)(hostReservePtr), hostReserveLen)
	copy(rawSlice, incomingBlock)

	botImpl.TickFunc(offset)

	return rawSlice
}
