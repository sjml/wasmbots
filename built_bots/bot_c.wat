(module $bot_c.wasm
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func))
  (type (;2;) (func (param i32) (result i32)))
  (import "env" "logFunction" (func $logFunction (type 0)))
  (func $__wasm_call_ctors (type 1))
  (func $strlen (type 2) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    i32.const 0
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=8
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.load offset=12
        local.set 5
        local.get 5
        i32.load8_u
        local.set 6
        i32.const 24
        local.set 7
        local.get 6
        local.get 7
        i32.shl
        local.set 8
        local.get 8
        local.get 7
        i32.shr_s
        local.set 9
        local.get 9
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=8
        local.set 10
        i32.const 1
        local.set 11
        local.get 10
        local.get 11
        i32.add
        local.set 12
        local.get 3
        local.get 12
        i32.store offset=8
        local.get 3
        i32.load offset=12
        local.set 13
        i32.const 1
        local.set 14
        local.get 13
        local.get 14
        i32.add
        local.set 15
        local.get 3
        local.get 15
        i32.store offset=12
        br 0 (;@2;)
      end
    end
    local.get 3
    i32.load offset=8
    local.set 16
    local.get 16
    return)
  (func $run (type 1)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    i32.const 1024
    local.set 3
    local.get 2
    local.get 3
    i32.store offset=12
    local.get 2
    i32.load offset=12
    local.set 4
    local.get 2
    i32.load offset=12
    local.set 5
    local.get 5
    call $strlen
    local.set 6
    local.get 4
    local.get 6
    call $logFunction
    i32.const 16
    local.set 7
    local.get 2
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    return)
  (memory (;0;) 2)
  (global $__stack_pointer (mut i32) (i32.const 66592))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1045))
  (global (;3;) i32 (i32.const 1056))
  (global (;4;) i32 (i32.const 66592))
  (global (;5;) i32 (i32.const 1024))
  (global (;6;) i32 (i32.const 66592))
  (global (;7;) i32 (i32.const 131072))
  (global (;8;) i32 (i32.const 0))
  (global (;9;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func $__wasm_call_ctors))
  (export "strlen" (func $strlen))
  (export "run" (func $run))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__stack_low" (global 3))
  (export "__stack_high" (global 4))
  (export "__global_base" (global 5))
  (export "__heap_base" (global 6))
  (export "__heap_end" (global 7))
  (export "__memory_base" (global 8))
  (export "__table_base" (global 9))
  (data $.rodata (i32.const 1024) "C -> wasm reporting!\00"))
