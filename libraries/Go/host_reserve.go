package wasmbot_client

import (
	"encoding/binary"
	"fmt"
	"math"
	"reflect"
	"unsafe"
)

var hostReserve []byte

func reserveHostMemory(size uintptr) bool {
	hostReserve = make([]byte, size)
	return true
}

func WriteString(offset uintptr, msg string) uintptr {
	msgBytes := []byte(msg)
	if offset+uintptr(len(msgBytes)) >= uintptr(len(hostReserve)) {
		LogErr("CLIENT ERROR: String too long to write to reserve memory")
		return offset
	}
	copy(hostReserve[offset:], msgBytes)
	return offset + uintptr(len(msgBytes))
}

type Numeric interface {
	int8 | int16 | int32 | int64 | uint | uint8 | uint16 | uint32 | uint64 | float32 | float64
}

func WriteNumber[T Numeric](offset uintptr, value T) uintptr {
	valSize := unsafe.Sizeof(value)

	if offset+valSize >= uintptr(len(hostReserve)) {
		LogErr(fmt.Sprintf("CLIENT ERROR: Writing %s outside of reserve memory", reflect.TypeOf(value).Name()))
		return offset
	}

	switch val := any(value).(type) {
	case uint8:
		hostReserve[offset] = val
	case int8:
		hostReserve[offset] = byte(val)
	case uint16:
		binary.LittleEndian.PutUint16(hostReserve[offset:], val)
	case int16:
		binary.LittleEndian.PutUint16(hostReserve[offset:], uint16(val))
	case uint32:
		binary.LittleEndian.PutUint32(hostReserve[offset:], val)
	case int32:
		binary.LittleEndian.PutUint32(hostReserve[offset:], uint32(val))
	case uint64:
		binary.LittleEndian.PutUint64(hostReserve[offset:], val)
	case int64:
		binary.LittleEndian.PutUint64(hostReserve[offset:], uint64(val))
	case float32:
		binary.LittleEndian.PutUint32(hostReserve[offset:], math.Float32bits(val))
	case float64:
		binary.LittleEndian.PutUint64(hostReserve[offset:], math.Float64bits(val))
	default:
		LogErr(fmt.Sprintf("CLIENT ERROR: Unsupported number type %s", reflect.TypeOf(value).Name()))
		return offset
	}

	return offset + valSize
}

func ReadString(offset uintptr, strLen int) string {
	if offset+uintptr(strLen) >= uintptr(len(hostReserve)) {
		LogErr("CLIENT ERROR: String read will overrun reserve memory")
		return ""
	}

	slice := hostReserve[offset : offset+uintptr(strLen)]
	return string(slice)
}

func ReadNumber[T Numeric](offset uintptr) T {
	var val T
	valSize := unsafe.Sizeof(val)

	if offset+valSize >= uintptr(len(hostReserve)) {
		LogErr(fmt.Sprintf("CLIENT ERROR: %s read will overrun reserve memory", reflect.TypeOf(val).Name()))
		return T(0)
	}

	switch any(val).(type) {
	case uint8:
		val = T(hostReserve[offset])
	case int8:
		val = T(hostReserve[offset])
	case uint16:
		val = T(binary.LittleEndian.Uint16(hostReserve[offset:]))
	case int16:
		val = T(binary.LittleEndian.Uint16(hostReserve[offset:]))
	case uint32:
		val = T(binary.LittleEndian.Uint32(hostReserve[offset:]))
	case int32:
		val = T(binary.LittleEndian.Uint32(hostReserve[offset:]))
	case uint64:
		val = T(binary.LittleEndian.Uint64(hostReserve[offset:]))
	case int64:
		val = T(binary.LittleEndian.Uint64(hostReserve[offset:]))
	case float32:
		val = T(math.Float32frombits(binary.LittleEndian.Uint32(hostReserve[offset:])))
	case float64:
		val = T(math.Float64frombits(binary.LittleEndian.Uint64(hostReserve[offset:])))
	default:
		LogErr(fmt.Sprintf("CLIENT ERROR: Unsupported number type %s", reflect.TypeOf(val).Name()))
		return T(0)
	}

	return val
}
