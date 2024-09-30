(module $bot_rs.wasm
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "env" "memory" (memory (;0;) 16 16))
  (import "env" "logFunction" (func $logFunction (type 0)))
  (func $run (type 1)
    i32.const 1024
    i32.const 23
    call $logFunction)
  (func $modmem (type 1)
    (local i32)
    i32.const 0
    i32.load
    local.tee 0
    i32.const 128
    i32.store8 offset=7
    local.get 0
    i32.const 64
    i32.store8 offset=5
    local.get 0
    i32.const 32
    i32.store8 offset=3
    local.get 0
    i32.const 16
    i32.store8 offset=1)
  (table (;0;) 1 1 funcref)
  (global $__stack_pointer (mut i32) (i32.const 1024))
  (global (;1;) i32 (i32.const 1047))
  (global (;2;) i32 (i32.const 1056))
  (export "run" (func $run))
  (export "modmem" (func $modmem))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data $.rodata (i32.const 1024) "Rust -> wasm reporting!"))
