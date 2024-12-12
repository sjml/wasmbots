//go:build !tinygo

// shims that will get overridden in the trainer harness

package wasmbot_client

var HostLogFunction = func(_ int32, _ uintptr, _ uintptr) {
	panic("This should be overridden in the harness.")
}

var GetRandomInt = func(_ int32, _ int32) int32 {
	panic("This should be overridden in the harness.")
}
