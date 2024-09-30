(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32 i32) (result i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i64)))
  (type (;7;) (func (result i32)))
  (type (;8;) (func (param i64) (result i64)))
  (import "env" "abort" (func (;0;) (type 5)))
  (import "env" "logFunction" (func (;1;) (type 1)))
  (func (;2;) (type 2)
    (local i32 i32)
    global.get 10
    local.tee 0
    if  ;; label = @1
      local.get 0
      call 4
    end
    i32.const 1360
    call 4
    i32.const 1056
    call 4
    i32.const 1168
    call 4
    i32.const 1664
    call 4
    global.get 4
    local.tee 1
    i32.load offset=4
    i32.const -4
    i32.and
    local.set 0
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.ne
      if  ;; label = @2
        local.get 0
        i32.load offset=4
        i32.const 3
        i32.and
        i32.const 3
        i32.ne
        if  ;; label = @3
          i32.const 0
          i32.const 1232
          i32.const 160
          i32.const 16
          call 0
          unreachable
        end
        local.get 0
        i32.const 20
        i32.add
        call 14
        local.get 0
        i32.load offset=4
        i32.const -4
        i32.and
        local.set 0
        br 1 (;@1;)
      end
    end)
  (func (;3;) (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    global.get 5
    i32.eq
    if  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 1232
        i32.const 148
        i32.const 30
        call 0
        unreachable
      end
      local.get 1
      global.set 5
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      i32.const -4
      i32.and
      local.tee 1
      i32.eqz
      if  ;; label = @2
        local.get 0
        i32.load offset=8
        i32.eqz
        local.get 0
        i32.const 34860
        i32.lt_u
        i32.and
        i32.eqz
        if  ;; label = @3
          i32.const 0
          i32.const 1232
          i32.const 128
          i32.const 18
          call 0
          unreachable
        end
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=8
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 1232
        i32.const 132
        i32.const 16
        call 0
        unreachable
      end
      local.get 1
      local.get 2
      i32.store offset=8
      local.get 2
      local.get 1
      local.get 2
      i32.load offset=4
      i32.const 3
      i32.and
      i32.or
      i32.store offset=4
    end
    global.get 6
    local.set 2
    local.get 0
    i32.load offset=12
    local.tee 1
    i32.const 2
    i32.le_u
    if (result i32)  ;; label = @1
      i32.const 1
    else
      local.get 1
      i32.const 2064
      i32.load
      i32.gt_u
      if  ;; label = @2
        i32.const 1360
        i32.const 1424
        i32.const 21
        i32.const 28
        call 0
        unreachable
      end
      local.get 1
      i32.const 2
      i32.shl
      i32.const 2068
      i32.add
      i32.load
      i32.const 32
      i32.and
    end
    local.set 3
    local.get 2
    i32.load offset=8
    local.set 1
    local.get 0
    global.get 7
    i32.eqz
    i32.const 2
    local.get 3
    select
    local.get 2
    i32.or
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 1
    local.get 0
    local.get 1
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store offset=8)
  (func (;4;) (type 0) (param i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      return
    end
    global.get 7
    local.get 0
    i32.const 20
    i32.sub
    local.tee 0
    i32.load offset=4
    i32.const 3
    i32.and
    i32.eq
    if  ;; label = @1
      local.get 0
      call 3
      global.get 3
      i32.const 1
      i32.add
      global.set 3
    end)
  (func (;5;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 1
    i32.load
    local.tee 3
    i32.const 1
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 268
      i32.const 14
      call 0
      unreachable
    end
    local.get 3
    i32.const -4
    i32.and
    local.tee 3
    i32.const 12
    i32.lt_u
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 270
      i32.const 14
      call 0
      unreachable
    end
    local.get 3
    i32.const 256
    i32.lt_u
    if (result i32)  ;; label = @1
      local.get 3
      i32.const 4
      i32.shr_u
    else
      i32.const 31
      i32.const 1073741820
      local.get 3
      local.get 3
      i32.const 1073741820
      i32.ge_u
      select
      local.tee 3
      i32.clz
      i32.sub
      local.tee 4
      i32.const 7
      i32.sub
      local.set 2
      local.get 3
      local.get 4
      i32.const 4
      i32.sub
      i32.shr_u
      i32.const 16
      i32.xor
    end
    local.tee 3
    i32.const 16
    i32.lt_u
    local.get 2
    i32.const 23
    i32.lt_u
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 284
      i32.const 14
      call 0
      unreachable
    end
    local.get 1
    i32.load offset=8
    local.set 5
    local.get 1
    i32.load offset=4
    local.tee 4
    if  ;; label = @1
      local.get 4
      local.get 5
      i32.store offset=8
    end
    local.get 5
    if  ;; label = @1
      local.get 5
      local.get 4
      i32.store offset=4
    end
    local.get 1
    local.get 0
    local.get 2
    i32.const 4
    i32.shl
    local.get 3
    i32.add
    i32.const 2
    i32.shl
    i32.add
    local.tee 1
    i32.load offset=96
    i32.eq
    if  ;; label = @1
      local.get 1
      local.get 5
      i32.store offset=96
      local.get 5
      i32.eqz
      if  ;; label = @2
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        local.tee 1
        i32.load offset=4
        i32.const -2
        local.get 3
        i32.rotl
        i32.and
        local.set 3
        local.get 1
        local.get 3
        i32.store offset=4
        local.get 3
        i32.eqz
        if  ;; label = @3
          local.get 0
          local.get 0
          i32.load
          i32.const -2
          local.get 2
          i32.rotl
          i32.and
          i32.store
        end
      end
    end)
  (func (;6;) (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 201
      i32.const 14
      call 0
      unreachable
    end
    local.get 1
    i32.load
    local.tee 3
    i32.const 1
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 203
      i32.const 14
      call 0
      unreachable
    end
    local.get 1
    i32.const 4
    i32.add
    local.get 1
    i32.load
    i32.const -4
    i32.and
    i32.add
    local.tee 4
    i32.load
    local.tee 2
    i32.const 1
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 4
      call 5
      local.get 1
      local.get 3
      i32.const 4
      i32.add
      local.get 2
      i32.const -4
      i32.and
      i32.add
      local.tee 3
      i32.store
      local.get 1
      i32.const 4
      i32.add
      local.get 1
      i32.load
      i32.const -4
      i32.and
      i32.add
      local.tee 4
      i32.load
      local.set 2
    end
    local.get 3
    i32.const 2
    i32.and
    if  ;; label = @1
      local.get 1
      i32.const 4
      i32.sub
      i32.load
      local.tee 1
      i32.load
      local.tee 6
      i32.const 1
      i32.and
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 1504
        i32.const 221
        i32.const 16
        call 0
        unreachable
      end
      local.get 0
      local.get 1
      call 5
      local.get 1
      local.get 6
      i32.const 4
      i32.add
      local.get 3
      i32.const -4
      i32.and
      i32.add
      local.tee 3
      i32.store
    end
    local.get 4
    local.get 2
    i32.const 2
    i32.or
    i32.store
    local.get 3
    i32.const -4
    i32.and
    local.tee 2
    i32.const 12
    i32.lt_u
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 233
      i32.const 14
      call 0
      unreachable
    end
    local.get 4
    local.get 1
    i32.const 4
    i32.add
    local.get 2
    i32.add
    i32.ne
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 234
      i32.const 14
      call 0
      unreachable
    end
    local.get 4
    i32.const 4
    i32.sub
    local.get 1
    i32.store
    local.get 2
    i32.const 256
    i32.lt_u
    if (result i32)  ;; label = @1
      local.get 2
      i32.const 4
      i32.shr_u
    else
      i32.const 31
      i32.const 1073741820
      local.get 2
      local.get 2
      i32.const 1073741820
      i32.ge_u
      select
      local.tee 2
      i32.clz
      i32.sub
      local.tee 3
      i32.const 7
      i32.sub
      local.set 5
      local.get 2
      local.get 3
      i32.const 4
      i32.sub
      i32.shr_u
      i32.const 16
      i32.xor
    end
    local.tee 2
    i32.const 16
    i32.lt_u
    local.get 5
    i32.const 23
    i32.lt_u
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 251
      i32.const 14
      call 0
      unreachable
    end
    local.get 0
    local.get 5
    i32.const 4
    i32.shl
    local.get 2
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    local.set 3
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store offset=8
    local.get 3
    if  ;; label = @1
      local.get 3
      local.get 1
      i32.store offset=4
    end
    local.get 0
    local.get 5
    i32.const 4
    i32.shl
    local.get 2
    i32.add
    i32.const 2
    i32.shl
    i32.add
    local.get 1
    i32.store offset=96
    local.get 0
    local.get 0
    i32.load
    i32.const 1
    local.get 5
    i32.shl
    i32.or
    i32.store
    local.get 0
    local.get 5
    i32.const 2
    i32.shl
    i32.add
    local.tee 0
    local.get 0
    i32.load offset=4
    i32.const 1
    local.get 2
    i32.shl
    i32.or
    i32.store offset=4)
  (func (;7;) (type 6) (param i32 i32 i64)
    (local i32 i32 i32)
    local.get 2
    local.get 1
    i64.extend_i32_u
    i64.lt_u
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 382
      i32.const 14
      call 0
      unreachable
    end
    local.get 1
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    i32.const 4
    i32.sub
    local.set 1
    local.get 0
    i32.load offset=1568
    local.tee 3
    if  ;; label = @1
      local.get 3
      i32.const 4
      i32.add
      local.get 1
      i32.gt_u
      if  ;; label = @2
        i32.const 0
        i32.const 1504
        i32.const 389
        i32.const 16
        call 0
        unreachable
      end
      local.get 3
      local.get 1
      i32.const 16
      i32.sub
      local.tee 5
      i32.eq
      if  ;; label = @2
        local.get 3
        i32.load
        local.set 4
        local.get 5
        local.set 1
      end
    else
      local.get 0
      i32.const 1572
      i32.add
      local.get 1
      i32.gt_u
      if  ;; label = @2
        i32.const 0
        i32.const 1504
        i32.const 402
        i32.const 5
        call 0
        unreachable
      end
    end
    local.get 2
    i32.wrap_i64
    i32.const -16
    i32.and
    local.get 1
    i32.sub
    local.tee 3
    i32.const 20
    i32.lt_u
    if  ;; label = @1
      return
    end
    local.get 1
    local.get 4
    i32.const 2
    i32.and
    local.get 3
    i32.const 8
    i32.sub
    local.tee 3
    i32.const 1
    i32.or
    i32.or
    i32.store
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store offset=8
    local.get 1
    i32.const 4
    i32.add
    local.get 3
    i32.add
    local.tee 3
    i32.const 2
    i32.store
    local.get 0
    local.get 3
    i32.store offset=1568
    local.get 0
    local.get 1
    call 6)
  (func (;8;) (type 2)
    (local i32 i32)
    memory.size
    local.tee 1
    i32.const 0
    i32.le_s
    if (result i32)  ;; label = @1
      i32.const 1
      local.get 1
      i32.sub
      memory.grow
      i32.const 0
      i32.lt_s
    else
      i32.const 0
    end
    if  ;; label = @1
      unreachable
    end
    i32.const 34864
    i32.const 0
    i32.store
    i32.const 36432
    i32.const 0
    i32.store
    loop  ;; label = @1
      local.get 0
      i32.const 23
      i32.lt_u
      if  ;; label = @2
        local.get 0
        i32.const 2
        i32.shl
        i32.const 34864
        i32.add
        i32.const 0
        i32.store offset=4
        i32.const 0
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 16
          i32.lt_u
          if  ;; label = @4
            local.get 0
            i32.const 4
            i32.shl
            local.get 1
            i32.add
            i32.const 2
            i32.shl
            i32.const 34864
            i32.add
            i32.const 0
            i32.store offset=96
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            br 1 (;@3;)
          end
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    i32.const 34864
    i32.const 36436
    memory.size
    i64.extend_i32_s
    i64.const 16
    i64.shl
    call 7
    i32.const 34864
    global.set 9)
  (func (;9;) (type 7) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 2
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;) 3 (;@1;)
          end
          i32.const 1
          global.set 2
          i32.const 0
          global.set 3
          call 2
          global.get 6
          global.set 5
          global.get 3
          return
        end
        global.get 7
        i32.eqz
        local.set 1
        global.get 5
        i32.load offset=4
        i32.const -4
        i32.and
        local.set 0
        loop  ;; label = @3
          local.get 0
          global.get 6
          i32.ne
          if  ;; label = @4
            local.get 0
            global.set 5
            local.get 1
            local.get 0
            i32.load offset=4
            local.tee 2
            i32.const 3
            i32.and
            i32.ne
            if  ;; label = @5
              local.get 0
              local.get 2
              i32.const -4
              i32.and
              local.get 1
              i32.or
              i32.store offset=4
              i32.const 0
              global.set 3
              local.get 0
              i32.const 20
              i32.add
              call 14
              global.get 3
              return
            end
            local.get 0
            i32.load offset=4
            i32.const -4
            i32.and
            local.set 0
            br 1 (;@3;)
          end
        end
        i32.const 0
        global.set 3
        call 2
        global.get 6
        global.get 5
        i32.load offset=4
        i32.const -4
        i32.and
        i32.eq
        if  ;; label = @3
          global.get 11
          local.set 0
          loop  ;; label = @4
            local.get 0
            i32.const 34860
            i32.lt_u
            if  ;; label = @5
              local.get 0
              i32.load
              call 4
              local.get 0
              i32.const 4
              i32.add
              local.set 0
              br 1 (;@4;)
            end
          end
          global.get 5
          i32.load offset=4
          i32.const -4
          i32.and
          local.set 0
          loop  ;; label = @4
            local.get 0
            global.get 6
            i32.ne
            if  ;; label = @5
              local.get 1
              local.get 0
              i32.load offset=4
              local.tee 2
              i32.const 3
              i32.and
              i32.ne
              if  ;; label = @6
                local.get 0
                local.get 2
                i32.const -4
                i32.and
                local.get 1
                i32.or
                i32.store offset=4
                local.get 0
                i32.const 20
                i32.add
                call 14
              end
              local.get 0
              i32.load offset=4
              i32.const -4
              i32.and
              local.set 0
              br 1 (;@4;)
            end
          end
          global.get 8
          local.set 0
          global.get 6
          global.set 8
          local.get 0
          global.set 6
          local.get 1
          global.set 7
          local.get 0
          i32.load offset=4
          i32.const -4
          i32.and
          global.set 5
          i32.const 2
          global.set 2
        end
        global.get 3
        return
      end
      global.get 5
      local.tee 0
      global.get 6
      i32.ne
      if  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const -4
        i32.and
        global.set 5
        global.get 7
        i32.eqz
        local.get 1
        i32.const 3
        i32.and
        i32.ne
        if  ;; label = @3
          i32.const 0
          i32.const 1232
          i32.const 229
          i32.const 20
          call 0
          unreachable
        end
        local.get 0
        i32.const 34860
        i32.lt_u
        if  ;; label = @3
          local.get 0
          i32.const 0
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.store offset=8
        else
          global.get 0
          local.get 0
          i32.load
          i32.const -4
          i32.and
          i32.const 4
          i32.add
          i32.sub
          global.set 0
          local.get 0
          i32.const 4
          i32.add
          local.tee 0
          i32.const 34860
          i32.ge_u
          if  ;; label = @4
            global.get 9
            i32.eqz
            if  ;; label = @5
              call 8
            end
            global.get 9
            local.set 1
            local.get 0
            i32.const 4
            i32.sub
            local.set 2
            local.get 0
            i32.const 15
            i32.and
            i32.const 1
            local.get 0
            select
            if (result i32)  ;; label = @5
              i32.const 1
            else
              local.get 2
              i32.load
              i32.const 1
              i32.and
            end
            if  ;; label = @5
              i32.const 0
              i32.const 1504
              i32.const 562
              i32.const 3
              call 0
              unreachable
            end
            local.get 2
            local.get 2
            i32.load
            i32.const 1
            i32.or
            i32.store
            local.get 1
            local.get 2
            call 6
          end
        end
        i32.const 10
        return
      end
      global.get 6
      global.get 6
      i32.store offset=4
      global.get 6
      global.get 6
      i32.store offset=8
      i32.const 0
      global.set 2
    end
    i32.const 0)
  (func (;10;) (type 3) (param i32 i32) (result i32)
    (local i32)
    local.get 1
    i32.const 256
    i32.lt_u
    if  ;; label = @1
      local.get 1
      i32.const 4
      i32.shr_u
      local.set 1
    else
      local.get 1
      i32.const 536870910
      i32.lt_u
      if  ;; label = @2
        local.get 1
        i32.const 1
        i32.const 27
        local.get 1
        i32.clz
        i32.sub
        i32.shl
        i32.add
        i32.const 1
        i32.sub
        local.set 1
      end
      local.get 1
      i32.const 31
      local.get 1
      i32.clz
      i32.sub
      local.tee 2
      i32.const 4
      i32.sub
      i32.shr_u
      i32.const 16
      i32.xor
      local.set 1
      local.get 2
      i32.const 7
      i32.sub
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.lt_u
    local.get 2
    i32.const 23
    i32.lt_u
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 334
      i32.const 14
      call 0
      unreachable
    end
    local.get 0
    local.get 2
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    i32.const -1
    local.get 1
    i32.shl
    i32.and
    local.tee 1
    if (result i32)  ;; label = @1
      local.get 0
      local.get 1
      i32.ctz
      local.get 2
      i32.const 4
      i32.shl
      i32.add
      i32.const 2
      i32.shl
      i32.add
      i32.load offset=96
    else
      local.get 0
      i32.load
      i32.const -1
      local.get 2
      i32.const 1
      i32.add
      i32.shl
      i32.and
      local.tee 1
      if (result i32)  ;; label = @2
        local.get 0
        local.get 1
        i32.ctz
        local.tee 1
        i32.const 2
        i32.shl
        i32.add
        i32.load offset=4
        local.tee 2
        i32.eqz
        if  ;; label = @3
          i32.const 0
          i32.const 1504
          i32.const 347
          i32.const 18
          call 0
          unreachable
        end
        local.get 0
        local.get 2
        i32.ctz
        local.get 1
        i32.const 4
        i32.shl
        i32.add
        i32.const 2
        i32.shl
        i32.add
        i32.load offset=96
      else
        i32.const 0
      end
    end)
  (func (;11;) (type 3) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const 1073741804
    i32.ge_u
    if  ;; label = @1
      i32.const 1168
      i32.const 1232
      i32.const 261
      i32.const 31
      call 0
      unreachable
    end
    global.get 0
    global.get 1
    i32.ge_u
    if  ;; label = @1
      block  ;; label = @2
        i32.const 2048
        local.set 2
        loop  ;; label = @3
          local.get 2
          call 9
          i32.sub
          local.set 2
          global.get 2
          i32.eqz
          if  ;; label = @4
            global.get 0
            i64.extend_i32_u
            i64.const 200
            i64.mul
            i64.const 100
            i64.div_u
            i32.wrap_i64
            i32.const 1024
            i32.add
            global.set 1
            br 2 (;@2;)
          end
          local.get 2
          i32.const 0
          i32.gt_s
          br_if 0 (;@3;)
        end
        global.get 0
        global.get 0
        global.get 1
        i32.sub
        i32.const 1024
        i32.lt_u
        i32.const 10
        i32.shl
        i32.add
        global.set 1
      end
    end
    global.get 9
    i32.eqz
    if  ;; label = @1
      call 8
    end
    global.get 9
    local.set 4
    local.get 0
    i32.const 16
    i32.add
    local.tee 2
    i32.const 1073741820
    i32.gt_u
    if  ;; label = @1
      i32.const 1168
      i32.const 1504
      i32.const 461
      i32.const 29
      call 0
      unreachable
    end
    local.get 4
    local.get 2
    i32.const 12
    i32.le_u
    if (result i32)  ;; label = @1
      i32.const 12
    else
      local.get 2
      i32.const 19
      i32.add
      i32.const -16
      i32.and
      i32.const 4
      i32.sub
    end
    local.tee 5
    call 10
    local.tee 2
    i32.eqz
    if  ;; label = @1
      memory.size
      local.tee 2
      local.get 5
      i32.const 256
      i32.ge_u
      if (result i32)  ;; label = @2
        local.get 5
        i32.const 536870910
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 5
          i32.const 1
          i32.const 27
          local.get 5
          i32.clz
          i32.sub
          i32.shl
          i32.add
          i32.const 1
          i32.sub
        else
          local.get 5
        end
      else
        local.get 5
      end
      i32.const 4
      local.get 4
      i32.load offset=1568
      local.get 2
      i32.const 16
      i32.shl
      i32.const 4
      i32.sub
      i32.ne
      i32.shl
      i32.add
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee 3
      local.get 2
      local.get 3
      i32.gt_s
      select
      memory.grow
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        local.get 3
        memory.grow
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          unreachable
        end
      end
      local.get 4
      local.get 2
      i32.const 16
      i32.shl
      memory.size
      i64.extend_i32_s
      i64.const 16
      i64.shl
      call 7
      local.get 4
      local.get 5
      call 10
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 1504
        i32.const 499
        i32.const 16
        call 0
        unreachable
      end
    end
    local.get 5
    local.get 2
    i32.load
    i32.const -4
    i32.and
    i32.gt_u
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 501
      i32.const 14
      call 0
      unreachable
    end
    local.get 4
    local.get 2
    call 5
    local.get 2
    i32.load
    local.set 6
    local.get 5
    i32.const 4
    i32.add
    i32.const 15
    i32.and
    if  ;; label = @1
      i32.const 0
      i32.const 1504
      i32.const 361
      i32.const 14
      call 0
      unreachable
    end
    local.get 6
    i32.const -4
    i32.and
    local.get 5
    i32.sub
    local.tee 3
    i32.const 16
    i32.ge_u
    if  ;; label = @1
      local.get 2
      local.get 5
      local.get 6
      i32.const 2
      i32.and
      i32.or
      i32.store
      local.get 2
      i32.const 4
      i32.add
      local.get 5
      i32.add
      local.tee 5
      local.get 3
      i32.const 4
      i32.sub
      i32.const 1
      i32.or
      i32.store
      local.get 4
      local.get 5
      call 6
    else
      local.get 2
      local.get 6
      i32.const -2
      i32.and
      i32.store
      local.get 2
      i32.const 4
      i32.add
      local.get 2
      i32.load
      i32.const -4
      i32.and
      i32.add
      local.tee 3
      local.get 3
      i32.load
      i32.const -3
      i32.and
      i32.store
    end
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=16
    global.get 8
    local.tee 1
    i32.load offset=8
    local.set 3
    local.get 2
    local.get 1
    global.get 7
    i32.or
    i32.store offset=4
    local.get 2
    local.get 3
    i32.store offset=8
    local.get 3
    local.get 2
    local.get 3
    i32.load offset=4
    i32.const 3
    i32.and
    i32.or
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store offset=8
    global.get 0
    local.get 2
    i32.load
    i32.const -4
    i32.and
    i32.const 4
    i32.add
    i32.add
    global.set 0
    local.get 2
    i32.const 20
    i32.add
    local.tee 1
    i32.const 0
    local.get 0
    memory.fill
    local.get 1)
  (func (;12;) (type 1) (param i32 i32)
    local.get 0
    local.get 1
    i32.store
    local.get 1
    if  ;; label = @1
      local.get 0
      i32.eqz
      if  ;; label = @2
        i32.const 0
        i32.const 1232
        i32.const 295
        i32.const 14
        call 0
        unreachable
      end
      global.get 7
      local.get 1
      i32.const 20
      i32.sub
      local.tee 1
      i32.load offset=4
      i32.const 3
      i32.and
      i32.eq
      if  ;; label = @2
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=4
        i32.const 3
        i32.and
        local.tee 0
        global.get 7
        i32.eqz
        i32.eq
        if  ;; label = @3
          local.get 1
          call 3
        else
          global.get 2
          i32.const 1
          i32.eq
          local.get 0
          i32.const 3
          i32.eq
          i32.and
          if  ;; label = @4
            local.get 1
            call 3
          end
        end
      end
    end)
  (func (;13;) (type 8) (param i64) (result i64)
    local.get 0
    i64.const 2
    i64.lt_u
    if (result i64)  ;; label = @1
      local.get 0
    else
      local.get 0
      i64.const 2
      i64.sub
      call 13
      local.get 0
      i64.const 1
      i64.sub
      call 13
      i64.add
    end)
  (func (;14;) (type 0) (param i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 8
                i32.sub
                i32.load
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 5 (;@1;) 5 (;@1;) 5 (;@1;) 4 (;@2;)
              end
              return
            end
            return
          end
          return
        end
        unreachable
      end
      unreachable
    end
    local.get 0
    i32.load
    local.tee 0
    if  ;; label = @1
      local.get 0
      call 4
    end)
  (func (;15;) (type 2)
    memory.size
    i32.const 16
    i32.shl
    i32.const 34860
    i32.sub
    i32.const 1
    i32.shr_u
    global.set 1
    i32.const 1284
    i32.const 1280
    i32.store
    i32.const 1288
    i32.const 1280
    i32.store
    i32.const 1280
    global.set 4
    i32.const 1316
    i32.const 1312
    i32.store
    i32.const 1320
    i32.const 1312
    i32.store
    i32.const 1312
    global.set 6
    i32.const 1460
    i32.const 1456
    i32.store
    i32.const 1464
    i32.const 1456
    i32.store
    i32.const 1456
    global.set 8
    i32.const 0
    call 16
    global.set 10)
  (func (;16;) (type 4) (param i32) (result i32)
    (local i32 i32 i32)
    global.get 11
    i32.const 8
    i32.sub
    global.set 11
    block  ;; label = @1
      global.get 11
      i32.const 2092
      i32.lt_s
      br_if 0 (;@1;)
      global.get 11
      i64.const 0
      i64.store
      global.get 11
      i32.const 12
      i32.const 4
      call 11
      local.tee 1
      i32.store
      global.get 11
      local.set 3
      global.get 11
      local.get 1
      i32.store offset=4
      global.get 11
      i32.const 16
      i32.sub
      global.set 11
      global.get 11
      i32.const 2092
      i32.lt_s
      br_if 0 (;@1;)
      global.get 11
      i64.const 0
      i64.store
      global.get 11
      i64.const 0
      i64.store offset=8
      local.get 1
      i32.eqz
      if  ;; label = @2
        global.get 11
        i32.const 12
        i32.const 3
        call 11
        local.tee 1
        i32.store
      end
      global.get 11
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      call 12
      global.get 11
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=4
      global.get 11
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 0
      i32.const 1073741820
      i32.gt_u
      if  ;; label = @2
        i32.const 1056
        i32.const 1104
        i32.const 19
        i32.const 57
        call 0
        unreachable
      end
      global.get 11
      local.get 0
      i32.const 1
      call 11
      local.tee 2
      i32.store offset=8
      global.get 11
      local.get 1
      i32.store offset=4
      global.get 11
      local.get 2
      i32.store offset=12
      local.get 1
      local.get 2
      call 12
      global.get 11
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store offset=4
      global.get 11
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 0
      i32.store offset=8
      global.get 11
      i32.const 16
      i32.add
      global.set 11
      local.get 3
      local.get 1
      i32.store
      global.get 11
      i32.const 8
      i32.add
      global.set 11
      local.get 1
      return
    end
    i32.const 34880
    i32.const 34928
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;17;) (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 11
    i32.const 8
    i32.sub
    global.set 11
    block  ;; label = @1
      global.get 11
      i32.const 2092
      i32.lt_s
      br_if 0 (;@1;)
      global.get 11
      i64.const 0
      i64.store
      global.get 11
      local.set 3
      global.get 11
      local.get 0
      i32.store
      local.get 0
      local.set 1
      global.get 11
      i32.const 4
      i32.sub
      global.set 11
      global.get 11
      i32.const 2092
      i32.lt_s
      br_if 0 (;@1;)
      global.get 11
      i32.const 0
      i32.store
      global.get 11
      local.get 0
      i32.store
      local.get 0
      local.set 2
      global.get 11
      i32.const 8
      i32.sub
      global.set 11
      global.get 11
      i32.const 2092
      i32.lt_s
      br_if 0 (;@1;)
      global.get 11
      i64.const 0
      i64.store
      global.get 11
      local.get 0
      i32.store
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      local.get 0
      i32.add
      local.set 4
      i32.const 0
      local.set 0
      loop  ;; label = @2
        local.get 1
        local.get 4
        i32.lt_u
        if  ;; label = @3
          local.get 1
          i32.load16_u
          local.tee 5
          i32.const 128
          i32.lt_u
          if (result i32)  ;; label = @4
            local.get 0
            i32.const 1
            i32.add
          else
            local.get 5
            i32.const 2048
            i32.lt_u
            if (result i32)  ;; label = @5
              local.get 0
              i32.const 2
              i32.add
            else
              local.get 5
              i32.const 64512
              i32.and
              i32.const 55296
              i32.eq
              local.get 1
              i32.const 2
              i32.add
              local.get 4
              i32.lt_u
              i32.and
              if  ;; label = @6
                local.get 1
                i32.load16_u offset=2
                i32.const 64512
                i32.and
                i32.const 56320
                i32.eq
                if  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 0
                  local.get 1
                  i32.const 4
                  i32.add
                  local.set 1
                  br 5 (;@2;)
                end
              end
              local.get 0
              i32.const 3
              i32.add
            end
          end
          local.set 0
          local.get 1
          i32.const 2
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
      global.get 11
      local.get 0
      i32.const 1
      call 11
      local.tee 1
      i32.store offset=4
      global.get 11
      local.get 2
      i32.store
      local.get 2
      local.get 2
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const -2
      i32.and
      i32.add
      local.set 5
      local.get 1
      local.set 0
      loop  ;; label = @2
        local.get 2
        local.get 5
        i32.lt_u
        if  ;; label = @3
          local.get 2
          i32.load16_u
          local.tee 6
          i32.const 128
          i32.lt_u
          if (result i32)  ;; label = @4
            local.get 0
            local.get 6
            i32.store8
            local.get 0
            i32.const 1
            i32.add
          else
            local.get 6
            i32.const 2048
            i32.lt_u
            if (result i32)  ;; label = @5
              local.get 0
              local.get 6
              i32.const 6
              i32.shr_u
              i32.const 192
              i32.or
              local.get 6
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.const 8
              i32.shl
              i32.or
              i32.store16
              local.get 0
              i32.const 2
              i32.add
            else
              local.get 6
              i32.const 63488
              i32.and
              i32.const 55296
              i32.eq
              if  ;; label = @6
                local.get 6
                i32.const 56320
                i32.lt_u
                local.get 2
                i32.const 2
                i32.add
                local.get 5
                i32.lt_u
                i32.and
                if  ;; label = @7
                  local.get 2
                  i32.load16_u offset=2
                  local.tee 4
                  i32.const 64512
                  i32.and
                  i32.const 56320
                  i32.eq
                  if  ;; label = @8
                    local.get 0
                    local.get 6
                    i32.const 1023
                    i32.and
                    i32.const 10
                    i32.shl
                    i32.const 65536
                    i32.add
                    local.get 4
                    i32.const 1023
                    i32.and
                    i32.or
                    local.tee 4
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 24
                    i32.shl
                    local.get 4
                    i32.const 6
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 16
                    i32.shl
                    i32.or
                    local.get 4
                    i32.const 12
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 8
                    i32.shl
                    i32.or
                    local.get 4
                    i32.const 18
                    i32.shr_u
                    i32.const 240
                    i32.or
                    i32.or
                    i32.store
                    local.get 0
                    i32.const 4
                    i32.add
                    local.set 0
                    local.get 2
                    i32.const 4
                    i32.add
                    local.set 2
                    br 6 (;@2;)
                  end
                end
              end
              local.get 0
              local.get 6
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              local.get 6
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.const 8
              i32.shl
              i32.or
              i32.store16
              local.get 0
              local.get 6
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=2
              local.get 0
              i32.const 3
              i32.add
            end
          end
          local.set 0
          local.get 2
          i32.const 2
          i32.add
          local.set 2
          br 1 (;@2;)
        end
      end
      global.get 11
      i32.const 8
      i32.add
      global.set 11
      global.get 11
      i32.const 4
      i32.add
      global.set 11
      local.get 3
      local.get 1
      i32.store offset=4
      global.get 11
      local.get 1
      i32.store
      local.get 1
      local.get 1
      i32.const 20
      i32.sub
      i32.load offset=16
      call 1
      global.get 11
      i32.const 8
      i32.add
      global.set 11
      return
    end
    i32.const 34880
    i32.const 34928
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;18;) (type 4) (param i32) (result i32)
    global.get 11
    i32.const 4
    i32.sub
    global.set 11
    global.get 11
    i32.const 2092
    i32.lt_s
    if  ;; label = @1
      i32.const 34880
      i32.const 34928
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 11
    i32.const 0
    i32.store
    global.get 11
    i32.const 1568
    i32.store
    i32.const 1568
    call 17
    local.get 0
    call 16
    global.set 10
    global.get 11
    global.get 10
    local.tee 0
    i32.store
    local.get 0
    i32.load offset=4
    local.set 0
    global.get 11
    i32.const 4
    i32.add
    global.set 11
    local.get 0)
  (func (;19;) (type 3) (param i32 i32) (result i32)
    (local i64 i32 i32)
    global.get 11
    i32.const 12
    i32.sub
    global.set 11
    block  ;; label = @1
      block  ;; label = @2
        global.get 11
        i32.const 2092
        i32.lt_s
        br_if 1 (;@1;)
        global.get 11
        i64.const 0
        i64.store
        global.get 11
        i32.const 0
        i32.store offset=8
        global.get 11
        global.get 10
        local.tee 3
        i32.store
        local.get 3
        i32.load offset=8
        local.get 1
        i32.const 8
        i32.add
        i32.lt_u
        if  ;; label = @3
          i32.const 1776
          local.set 0
          global.get 11
          i32.const 1776
          i32.store
          br 1 (;@2;)
        end
        global.get 11
        global.get 10
        local.tee 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=8
        i32.gt_u
        if  ;; label = @3
          i32.const 1840
          local.set 0
          global.get 11
          i32.const 1840
          i32.store
          br 1 (;@2;)
        end
        global.get 11
        global.get 10
        local.tee 3
        i32.store
        global.get 11
        i32.const 4
        i32.sub
        global.set 11
        global.get 11
        i32.const 2092
        i32.lt_s
        br_if 1 (;@1;)
        global.get 11
        i32.const 0
        i32.store
        global.get 11
        local.get 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=8
        i32.ge_u
        if  ;; label = @3
          i32.const 1360
          i32.const 1888
          i32.const 167
          i32.const 45
          call 0
          unreachable
        end
        global.get 11
        local.get 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=4
        i32.add
        i32.load8_u
        local.set 0
        global.get 11
        i32.const 4
        i32.add
        global.set 11
        local.get 0
        i32.const 93
        i32.gt_u
        if  ;; label = @3
          i32.const 1952
          local.set 0
          global.get 11
          i32.const 1952
          i32.store
          br 1 (;@2;)
        end
        local.get 0
        i64.extend_i32_u
        call 13
        local.set 2
        global.get 11
        global.get 10
        local.tee 0
        i32.store offset=4
        global.get 11
        local.get 0
        i32.load
        local.tee 3
        i32.store
        global.get 11
        block (result i32)  ;; label = @3
          global.get 11
          i32.const 8
          i32.sub
          global.set 11
          block  ;; label = @4
            global.get 11
            i32.const 2092
            i32.lt_s
            br_if 0 (;@4;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            local.get 3
            i32.store
            local.get 3
            i32.const 20
            i32.sub
            i32.load offset=16
            local.set 4
            global.get 11
            i32.const 0
            i32.store
            global.get 11
            local.get 3
            i32.store offset=4
            global.get 11
            i32.const 12
            i32.sub
            global.set 11
            global.get 11
            i32.const 2092
            i32.lt_s
            br_if 0 (;@4;)
            global.get 11
            i64.const 0
            i64.store
            global.get 11
            i32.const 0
            i32.store offset=8
            global.get 11
            i32.const 12
            i32.const 5
            call 11
            local.tee 0
            i32.store
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            call 12
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store offset=4
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store offset=8
            global.get 11
            local.get 3
            i32.store offset=4
            local.get 3
            i32.const 20
            i32.sub
            i32.load offset=16
            local.get 4
            i32.lt_u
            local.get 4
            i32.const 1073741820
            i32.gt_u
            i32.or
            if  ;; label = @5
              i32.const 1056
              i32.const 2016
              i32.const 25
              i32.const 7
              call 0
              unreachable
            end
            global.get 11
            local.get 0
            i32.store offset=4
            global.get 11
            local.get 3
            i32.store offset=8
            local.get 0
            local.get 3
            call 12
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            local.get 3
            i32.store offset=4
            global.get 11
            local.get 0
            i32.store offset=4
            local.get 0
            local.get 4
            i32.store offset=8
            global.get 11
            i32.const 12
            i32.add
            global.set 11
            global.get 11
            i32.const 8
            i32.add
            global.set 11
            local.get 0
            br 1 (;@3;)
          end
          br 2 (;@1;)
        end
        local.tee 0
        i32.store offset=8
        global.get 11
        local.get 0
        i32.store
        global.get 11
        i32.const 4
        i32.sub
        global.set 11
        global.get 11
        i32.const 2092
        i32.lt_s
        br_if 1 (;@1;)
        global.get 11
        i32.const 0
        i32.store
        global.get 11
        local.get 0
        i32.store
        local.get 1
        i32.const 31
        i32.shr_u
        local.get 0
        i32.load offset=8
        local.get 1
        i32.const 8
        i32.add
        i32.lt_s
        i32.or
        if  ;; label = @3
          i32.const 1360
          i32.const 2016
          i32.const 174
          i32.const 7
          call 0
          unreachable
        end
        global.get 11
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.load offset=4
        i32.add
        local.get 2
        i64.store
        global.get 11
        i32.const 4
        i32.add
        global.set 11
        global.get 11
        i32.const 12
        i32.add
        global.set 11
        i32.const 1
        return
      end
      local.get 0
      call 17
      global.get 11
      i32.const 12
      i32.add
      global.set 11
      i32.const 0
      return
    end
    i32.const 34880
    i32.const 34928
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 0))
  (global (;1;) (mut i32) (i32.const 0))
  (global (;2;) (mut i32) (i32.const 0))
  (global (;3;) (mut i32) (i32.const 0))
  (global (;4;) (mut i32) (i32.const 0))
  (global (;5;) (mut i32) (i32.const 0))
  (global (;6;) (mut i32) (i32.const 0))
  (global (;7;) (mut i32) (i32.const 0))
  (global (;8;) (mut i32) (i32.const 0))
  (global (;9;) (mut i32) (i32.const 0))
  (global (;10;) (mut i32) (i32.const 0))
  (global (;11;) (mut i32) (i32.const 34860))
  (export "setup" (func 18))
  (export "runFib" (func 19))
  (export "memory" (memory 0))
  (start 15)
  (data (;0;) (i32.const 1036) ",")
  (data (;1;) (i32.const 1048) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
  (data (;2;) (i32.const 1084) "<")
  (data (;3;) (i32.const 1096) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
  (data (;4;) (i32.const 1148) "<")
  (data (;5;) (i32.const 1160) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
  (data (;6;) (i32.const 1212) "<")
  (data (;7;) (i32.const 1224) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
  (data (;8;) (i32.const 1340) "<")
  (data (;9;) (i32.const 1352) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
  (data (;10;) (i32.const 1404) ",")
  (data (;11;) (i32.const 1416) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
  (data (;12;) (i32.const 1484) "<")
  (data (;13;) (i32.const 1496) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
  (data (;14;) (i32.const 1548) "\5c")
  (data (;15;) (i32.const 1560) "\02\00\00\00B\00\00\00A\00s\00s\00e\00m\00b\00l\00y\00S\00c\00r\00i\00p\00t\00 \00-\00>\00 \00w\00a\00s\00m\00 \00r\00e\00p\00o\00r\00t\00i\00n\00g\00!")
  (data (;16;) (i32.const 1644) "<")
  (data (;17;) (i32.const 1656) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
  (data (;18;) (i32.const 1708) ",")
  (data (;19;) (i32.const 1720) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
  (data (;20;) (i32.const 1756) "<")
  (data (;21;) (i32.const 1768) "\02\00\00\00*\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00e\00s\00u\00l\00t\00 \00o\00f\00f\00s\00e\00t")
  (data (;22;) (i32.const 1820) ",")
  (data (;23;) (i32.const 1832) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00o\00f\00f\00s\00e\00t")
  (data (;24;) (i32.const 1868) "<")
  (data (;25;) (i32.const 1880) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;26;) (i32.const 1932) "<")
  (data (;27;) (i32.const 1944) "\02\00\00\00$\00\00\00F\00i\00b\00 \00i\00n\00d\00e\00x\00 \00t\00o\00o\00 \00h\00i\00g\00h")
  (data (;28;) (i32.const 1996) "<")
  (data (;29;) (i32.const 2008) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s")
  (data (;30;) (i32.const 2064) "\06\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00A"))
