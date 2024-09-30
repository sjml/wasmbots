(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "env" "logFunction" (func (;0;) (type 0)))
  (func (;1;) (type 1)
    i32.const 1048576
    i32.const 22
    call 0)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "run" (func 1))
  (data (;0;) (i32.const 1048576) "Zig -> wasm reporting!\00"))
