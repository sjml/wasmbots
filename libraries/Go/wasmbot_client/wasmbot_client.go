package wasmbot_client

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"io"
	"unsafe"
)

const GP_VERSION uint16 = 7
const MAX_NAME_LEN int = 26

type BotMetadata struct {
	Name    string
	Version [3]uint16
}

func Log(msg string) {
	msgBytes := []byte(msg)
	HostLogFunction(2, uintptr(unsafe.Pointer(&msgBytes[0])), uintptr(len(msgBytes)))
}

func LogErr(msg string) {
	msgBytes := []byte(msg)
	HostLogFunction(0, uintptr(unsafe.Pointer(&msgBytes[0])), uintptr(len(msgBytes)))
}

type ClientSetupFunction func() BotMetadata
type ClientReceiveGameParamsFunction func(InitialParameters) bool
type TickFunction func(PresentCircumstances) Message

var clientSetup ClientSetupFunction = _clientSetupNoop
var clientReceiveGameParams ClientReceiveGameParamsFunction = _clientReceiveGameParamsNoop
var clientTick TickFunction = _clientTickNoop

func _clientSetupNoop() BotMetadata {
	LogErr("No ClientSetupFunction set!")
	return BotMetadata{Name: "[INVALID]", Version: [3]uint16{0, 0, 0}}
}

func _clientReceiveGameParamsNoop(params InitialParameters) bool {
	LogErr("No ClientReceiveGameParamsFunction set!")
	return true
}

func _clientTickNoop(_ PresentCircumstances) Message {
	errMsg := _Error{Description: "No client tick function registered"}
	return errMsg
}

func RegisterClientSetup(setup ClientSetupFunction) {
	clientSetup = setup
}

func RegisterClientReceiveGameParams(receiveGameParams ClientReceiveGameParamsFunction) {
	clientReceiveGameParams = receiveGameParams
}

func RegisterTickCallback(cb TickFunction) {
	clientTick = cb
}

var hostReserve []byte

func reserveHostMemory(size uintptr) bool {
	if hostReserve != nil {
		LogErr("CLIENT ERROR: Attempting to reserve memory twice")
		return false
	}
	hostReserve = make([]byte, size)
	return true
}

//export setup
func Setup(request uintptr) uintptr {
	reserveHostMemory(request)

	botData := clientSetup()

	offset := 0
	copy(hostReserve[offset:], []byte(botData.Name))
	offset += len(botData.Name)
	paddingSize := MAX_NAME_LEN - len(botData.Name)
	if paddingSize > 0 {
		copy(hostReserve[offset:offset+paddingSize], make([]byte, paddingSize))
	}
	offset = MAX_NAME_LEN
	for vei, ve := range botData.Version {
		binary.LittleEndian.PutUint16(hostReserve[offset+vei*2:], ve)
	}
	offset += len(botData.Version) * 2

	return uintptr(unsafe.Pointer(&hostReserve[0]))
}

//export receiveGameParams
func ReceiveGameParams(offset uintptr) bool {
	paramsReader := bytes.NewReader(hostReserve[offset:])
	initParams, err := InitialParametersFromBytes(paramsReader)
	if err != nil {
		LogErr(fmt.Errorf("ERROR: Could not parse InitialParameters in host reserve: %w", err).Error())
		return false
	}
	if initParams.ParamsVersion != GP_VERSION {
		LogErr(fmt.Sprintf("ERROR: Can't parse GameParams v%d; only prepared for v%d", initParams.ParamsVersion, GP_VERSION))
		return false
	}

	return clientReceiveGameParams(*initParams)
}

// not sure if this is more broadly useful...
type sliceWriter struct {
	data   []byte
	offset int
}

func (w *sliceWriter) Write(p []byte) (n int, err error) {
	if w.offset+len(p) > len(w.data) {
		return 0, io.ErrShortWrite
	}
	n = copy(w.data[w.offset:], p)
	w.offset += n
	return n, nil
}

//export tick
func Tick(offset uintptr) {
	circsReader := bytes.NewReader(hostReserve[offset:])
	circumstances, err := PresentCircumstancesFromBytes(circsReader)

	var submittedMove Message
	if err != nil {
		errStr := fmt.Errorf("ERROR: Could not parse PresentCircumstances in host reserve: %w", err)
		LogErr(errStr.Error())
		submittedMove = _Error{Description: errStr.Error()}
	} else {
		submittedMove = clientTick(*circumstances)
	}

	moveWriter := &sliceWriter{data: hostReserve, offset: 0}
	submittedMove.WriteBytes(moveWriter, true)
}
