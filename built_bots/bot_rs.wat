(module $bot_rs.wasm
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (import "env" "logFunction" (func $logFunction (type 0)))
  (func $run (type 1)
    i32.const 1048576
    i32.const 23
    call $logFunction)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1048599))
  (global (;2;) i32 (i32.const 1048608))
  (export "memory" (memory 0))
  (export "run" (func $run))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data $.rodata (i32.const 1048576) "Rust -> wasm reporting!"))
