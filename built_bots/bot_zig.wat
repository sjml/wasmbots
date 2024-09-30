(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "env" "memory" (memory (;0;) 16 16))
  (import "env" "logFunction" (func (;0;) (type 0)))
  (func (;1;) (type 1)
    i32.const 1024
    i32.const 22
    call 0)
  (global (;0;) (mut i32) (i32.const 1024))
  (export "run" (func 1))
  (data (;0;) (i32.const 1024) "Zig -> wasm reporting!\00"))
