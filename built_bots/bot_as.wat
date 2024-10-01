(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32 i32 i32 i32)))
  (type (;6;) (func (param i32 i32 i64)))
  (type (;7;) (func (result i32)))
  (type (;8;) (func (param i32 i32 i32)))
  (type (;9;) (func (param i64) (result i64)))
  (import "env" "abort" (func (;0;) (type 5)))
  (import "env" "logFunction" (func (;1;) (type 4)))
  (func (;2;) (type 3)
    (local i32 i32)
    i32.const 1056
    call 4
    i32.const 1120
    call 4
    global.get 10
    local.tee 0
    if  ;; label = @1
      local.get 0
      call 4
    end
    global.get 12
    local.tee 0
    if  ;; label = @1
      local.get 0
      call 4
    end
    i32.const 1472
    call 4
    i32.const 1168
    call 4
    i32.const 1280
    call 4
    i32.const 3696
    call 4
    i32.const 2512
    call 4
    i32.const 3568
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
          i32.const 1344
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
  (func (;3;) (type 1) (param i32)
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
        i32.const 1344
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
        i32.const 37092
        i32.lt_u
        i32.and
        i32.eqz
        if  ;; label = @3
          i32.const 0
          i32.const 1344
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
        i32.const 1344
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
      i32.const 4288
      i32.load
      i32.gt_u
      if  ;; label = @2
        i32.const 1472
        i32.const 1536
        i32.const 21
        i32.const 28
        call 0
        unreachable
      end
      local.get 1
      i32.const 2
      i32.shl
      i32.const 4292
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
  (func (;4;) (type 1) (param i32)
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
  (func (;5;) (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 1
    i32.load
    local.tee 3
    i32.const 1
    i32.and
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1616
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
      i32.const 1616
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
      i32.const 1616
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
  (func (;6;) (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1616
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
      i32.const 1616
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
        i32.const 1616
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
      i32.const 1616
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
      i32.const 1616
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
      i32.const 1616
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
      i32.const 1616
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
        i32.const 1616
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
        i32.const 1616
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
  (func (;8;) (type 3)
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
    i32.const 37104
    i32.const 0
    i32.store
    i32.const 38672
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
        i32.const 37104
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
            i32.const 37104
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
    i32.const 37104
    i32.const 38676
    memory.size
    i64.extend_i32_s
    i64.const 16
    i64.shl
    call 7
    i32.const 37104
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
          global.get 13
          local.set 0
          loop  ;; label = @4
            local.get 0
            i32.const 37092
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
          i32.const 1344
          i32.const 229
          i32.const 20
          call 0
          unreachable
        end
        local.get 0
        i32.const 37092
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
          i32.const 37092
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
              i32.const 1616
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
  (func (;10;) (type 2) (param i32 i32) (result i32)
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
      i32.const 1616
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
          i32.const 1616
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
  (func (;11;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const 1073741804
    i32.ge_u
    if  ;; label = @1
      i32.const 1280
      i32.const 1344
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
      i32.const 1280
      i32.const 1616
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
        i32.const 1616
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
      i32.const 1616
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
      i32.const 1616
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
  (func (;12;) (type 8) (param i32 i32 i32)
    (local i32)
    local.get 1
    i32.eqz
    if  ;; label = @1
      return
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 0
      i32.const 1344
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
    if  ;; label = @1
      local.get 0
      i32.const 20
      i32.sub
      local.tee 0
      i32.load offset=4
      i32.const 3
      i32.and
      local.tee 3
      global.get 7
      i32.eqz
      i32.eq
      if  ;; label = @2
        local.get 0
        local.get 1
        local.get 2
        select
        call 3
      else
        global.get 2
        i32.const 1
        i32.eq
        local.get 3
        i32.const 3
        i32.eq
        i32.and
        if  ;; label = @3
          local.get 1
          call 3
        end
      end
    end)
  (func (;13;) (type 9) (param i64) (result i64)
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
  (func (;14;) (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 8
                  i32.sub
                  i32.load
                  br_table 0 (;@7;) 1 (;@6;) 2 (;@5;) 6 (;@1;) 3 (;@4;) 6 (;@1;) 6 (;@1;) 4 (;@3;) 5 (;@2;)
                end
                return
              end
              return
            end
            return
          end
          global.get 13
          i32.const 4
          i32.sub
          global.set 13
          global.get 13
          i32.const 4324
          i32.lt_s
          if  ;; label = @4
            i32.const 37120
            i32.const 37168
            i32.const 1
            i32.const 1
            call 0
            unreachable
          end
          global.get 13
          i32.const 0
          i32.store
          global.get 13
          local.get 0
          i32.store
          local.get 0
          i32.load
          call 4
          global.get 13
          i32.const 4
          i32.add
          global.set 13
          return
        end
        local.get 0
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        i32.add
        local.set 1
        loop  ;; label = @3
          local.get 0
          local.get 1
          i32.lt_u
          if  ;; label = @4
            local.get 0
            i32.load
            local.tee 2
            if  ;; label = @5
              local.get 2
              call 4
            end
            local.get 0
            i32.const 4
            i32.add
            local.set 0
            br 1 (;@3;)
          end
        end
        return
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
  (func (;15;) (type 3)
    (local i32)
    global.get 13
    i32.const 8
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i64.const 0
    i64.store
    memory.size
    i32.const 16
    i32.shl
    i32.const 37092
    i32.sub
    i32.const 1
    i32.shr_u
    global.set 1
    i32.const 1396
    i32.const 1392
    i32.store
    i32.const 1400
    i32.const 1392
    i32.store
    i32.const 1392
    global.set 4
    i32.const 1428
    i32.const 1424
    i32.store
    i32.const 1432
    i32.const 1424
    i32.store
    i32.const 1424
    global.set 6
    i32.const 1572
    i32.const 1568
    i32.store
    i32.const 1576
    i32.const 1568
    i32.store
    i32.const 1568
    global.set 8
    i32.const 0
    call 16
    global.set 10
    global.get 13
    global.get 10
    local.tee 0
    i32.store offset=4
    global.get 13
    local.get 0
    i32.load
    local.tee 0
    i32.store
    i32.const 1
    global.set 11
    local.get 0
    call 17
    global.set 12
    global.get 13
    i32.const 8
    i32.add
    global.set 13)
  (func (;16;) (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    global.get 13
    i32.const 8
    i32.sub
    global.set 13
    block  ;; label = @1
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      i32.const 12
      i32.const 5
      call 11
      local.tee 1
      i32.store
      global.get 13
      local.set 3
      global.get 13
      local.get 1
      i32.store offset=4
      global.get 13
      i32.const 16
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      i64.const 0
      i64.store offset=8
      local.get 1
      i32.eqz
      if  ;; label = @2
        global.get 13
        i32.const 12
        i32.const 3
        call 11
        local.tee 1
        i32.store
      end
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store
      local.get 1
      i32.const 0
      i32.const 0
      call 12
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=4
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 0
      i32.const 1073741820
      i32.gt_u
      if  ;; label = @2
        i32.const 1168
        i32.const 1216
        i32.const 19
        i32.const 57
        call 0
        unreachable
      end
      global.get 13
      local.get 0
      i32.const 1
      call 11
      local.tee 2
      i32.store offset=8
      global.get 13
      local.get 1
      i32.store offset=4
      global.get 13
      local.get 2
      i32.store offset=12
      local.get 1
      local.get 2
      i32.store
      local.get 1
      local.get 2
      i32.const 0
      call 12
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store offset=4
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 0
      i32.store offset=8
      global.get 13
      i32.const 16
      i32.add
      global.set 13
      local.get 3
      local.get 1
      i32.store
      global.get 13
      i32.const 8
      i32.add
      global.set 13
      local.get 1
      return
    end
    i32.const 37120
    i32.const 37168
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;17;) (type 0) (param i32) (result i32)
    (local i32 i32)
    global.get 13
    i32.const 8
    i32.sub
    global.set 13
    block  ;; label = @1
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            global.get 11
            i32.const 1
            i32.sub
            br_table 1 (;@3;) 1 (;@3;) 2 (;@2;) 0 (;@4;)
          end
          unreachable
        end
        global.get 13
        local.get 0
        i32.store
        local.get 0
        i32.const 20
        i32.sub
        i32.load offset=16
        local.set 2
      end
      global.get 13
      i32.const 0
      i32.store
      global.get 13
      local.get 0
      i32.store offset=4
      global.get 13
      i32.const 12
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      i32.const 0
      i32.store offset=8
      global.get 13
      i32.const 12
      i32.const 6
      call 11
      local.tee 1
      i32.store
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store
      local.get 1
      i32.const 0
      i32.const 0
      call 12
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=4
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store offset=8
      global.get 13
      local.get 0
      i32.store offset=4
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      local.get 2
      i32.lt_u
      local.get 2
      i32.const 1073741820
      i32.gt_u
      i32.or
      if  ;; label = @2
        i32.const 1168
        i32.const 1680
        i32.const 25
        i32.const 7
        call 0
        unreachable
      end
      global.get 13
      local.get 1
      i32.store offset=4
      global.get 13
      local.get 0
      i32.store offset=8
      local.get 1
      local.get 0
      i32.store
      local.get 1
      local.get 0
      i32.const 0
      call 12
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 0
      i32.store offset=4
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      local.get 2
      i32.store offset=8
      global.get 13
      i32.const 12
      i32.add
      global.set 13
      global.get 13
      i32.const 8
      i32.add
      global.set 13
      local.get 1
      return
    end
    i32.const 37120
    i32.const 37168
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;18;) (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 13
    i32.const 16
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i64.const 0
    i64.store
    global.get 13
    i64.const 0
    i64.store offset=8
    local.get 1
    i32.const 1
    i32.sub
    local.tee 4
    i32.const 0
    i32.lt_s
    if  ;; label = @1
      global.get 13
      i32.const 16
      i32.add
      global.set 13
      i32.const 3664
      return
    end
    local.get 4
    i32.eqz
    if  ;; label = @1
      global.get 13
      local.get 0
      i32.load
      local.tee 0
      i32.store
      global.get 13
      i32.const 16
      i32.add
      global.set 13
      local.get 0
      i32.const 3664
      local.get 0
      select
      return
    end
    loop  ;; label = @1
      local.get 1
      local.get 3
      i32.gt_s
      if  ;; label = @2
        global.get 13
        local.get 0
        local.get 3
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 5
        i32.store offset=4
        local.get 5
        if  ;; label = @3
          global.get 13
          local.get 5
          i32.store offset=8
          local.get 2
          local.get 5
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          i32.add
          local.set 2
        end
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 1 (;@1;)
      end
    end
    i32.const 0
    local.set 3
    global.get 13
    i32.const 3664
    i32.store offset=8
    global.get 13
    local.get 2
    i32.const 3660
    i32.load
    i32.const 1
    i32.shr_u
    local.tee 1
    local.get 4
    i32.mul
    i32.add
    i32.const 1
    i32.shl
    i32.const 2
    call 11
    local.tee 5
    i32.store offset=12
    i32.const 0
    local.set 2
    loop  ;; label = @1
      local.get 2
      local.get 4
      i32.lt_s
      if  ;; label = @2
        global.get 13
        local.get 0
        local.get 2
        i32.const 2
        i32.shl
        i32.add
        i32.load
        local.tee 6
        i32.store offset=4
        local.get 6
        if  ;; label = @3
          global.get 13
          local.get 6
          i32.store offset=8
          local.get 5
          local.get 3
          i32.const 1
          i32.shl
          i32.add
          local.get 6
          local.get 6
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          local.tee 6
          i32.const 1
          i32.shl
          memory.copy
          local.get 3
          local.get 6
          i32.add
          local.set 3
        end
        local.get 1
        if  ;; label = @3
          local.get 5
          local.get 3
          i32.const 1
          i32.shl
          i32.add
          i32.const 3664
          local.get 1
          i32.const 1
          i32.shl
          memory.copy
          local.get 1
          local.get 3
          i32.add
          local.set 3
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    global.get 13
    local.get 0
    local.get 4
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee 0
    i32.store offset=4
    local.get 0
    if  ;; label = @1
      global.get 13
      local.get 0
      i32.store offset=8
      local.get 5
      local.get 3
      i32.const 1
      i32.shl
      i32.add
      local.get 0
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const -2
      i32.and
      memory.copy
    end
    global.get 13
    i32.const 16
    i32.add
    global.set 13
    local.get 5)
  (func (;19;) (type 0) (param i32) (result i32)
    (local i32)
    global.get 13
    i32.const 8
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i64.const 0
    i64.store
    global.get 13
    local.get 0
    i32.store offset=4
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 2
    i32.shr_u
    local.set 1
    global.get 13
    i32.const 3664
    i32.store
    local.get 0
    local.get 1
    call 18
    local.set 0
    global.get 13
    i32.const 8
    i32.add
    global.set 13
    local.get 0)
  (func (;20;) (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 13
    i32.const 4
    i32.sub
    global.set 13
    block  ;; label = @1
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.store
      block  ;; label = @2
        block  ;; label = @3
          global.get 11
          i32.const 1
          i32.sub
          br_table 1 (;@2;) 1 (;@2;) 1 (;@2;) 0 (;@3;)
        end
        unreachable
      end
      global.get 13
      local.get 0
      i32.store
      global.get 13
      i32.const 8
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      local.get 0
      local.tee 1
      i32.store
      local.get 1
      i32.const 20
      i32.sub
      i32.load offset=16
      local.get 1
      i32.add
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.lt_u
        if  ;; label = @3
          local.get 0
          i32.load16_u
          local.tee 4
          i32.const 128
          i32.lt_u
          if (result i32)  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
          else
            local.get 4
            i32.const 2048
            i32.lt_u
            if (result i32)  ;; label = @5
              local.get 2
              i32.const 2
              i32.add
            else
              local.get 4
              i32.const 64512
              i32.and
              i32.const 55296
              i32.eq
              local.get 0
              i32.const 2
              i32.add
              local.get 3
              i32.lt_u
              i32.and
              if  ;; label = @6
                local.get 0
                i32.load16_u offset=2
                i32.const 64512
                i32.and
                i32.const 56320
                i32.eq
                if  ;; label = @7
                  local.get 2
                  i32.const 4
                  i32.add
                  local.set 2
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 0
                  br 5 (;@2;)
                end
              end
              local.get 2
              i32.const 3
              i32.add
            end
          end
          local.set 2
          local.get 0
          i32.const 2
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
      global.get 13
      local.get 2
      i32.const 1
      call 11
      local.tee 0
      i32.store offset=4
      global.get 13
      local.get 1
      i32.store
      local.get 1
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const -2
      i32.and
      local.get 1
      i32.add
      local.set 4
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 1
        local.get 4
        i32.lt_u
        if  ;; label = @3
          local.get 1
          i32.load16_u
          local.tee 3
          i32.const 128
          i32.lt_u
          if (result i32)  ;; label = @4
            local.get 2
            local.get 3
            i32.store8
            local.get 2
            i32.const 1
            i32.add
          else
            local.get 3
            i32.const 2048
            i32.lt_u
            if (result i32)  ;; label = @5
              local.get 2
              local.get 3
              i32.const 6
              i32.shr_u
              i32.const 192
              i32.or
              local.get 3
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.const 8
              i32.shl
              i32.or
              i32.store16
              local.get 2
              i32.const 2
              i32.add
            else
              local.get 3
              i32.const 63488
              i32.and
              i32.const 55296
              i32.eq
              if  ;; label = @6
                local.get 3
                i32.const 56320
                i32.lt_u
                local.get 1
                i32.const 2
                i32.add
                local.get 4
                i32.lt_u
                i32.and
                if  ;; label = @7
                  local.get 1
                  i32.load16_u offset=2
                  local.tee 5
                  i32.const 64512
                  i32.and
                  i32.const 56320
                  i32.eq
                  if  ;; label = @8
                    local.get 2
                    local.get 3
                    i32.const 1023
                    i32.and
                    i32.const 10
                    i32.shl
                    i32.const 65536
                    i32.add
                    local.get 5
                    i32.const 1023
                    i32.and
                    i32.or
                    local.tee 3
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 24
                    i32.shl
                    local.get 3
                    i32.const 6
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 16
                    i32.shl
                    i32.or
                    local.get 3
                    i32.const 12
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.const 8
                    i32.shl
                    i32.or
                    local.get 3
                    i32.const 18
                    i32.shr_u
                    i32.const 240
                    i32.or
                    i32.or
                    i32.store
                    local.get 2
                    i32.const 4
                    i32.add
                    local.set 2
                    local.get 1
                    i32.const 4
                    i32.add
                    local.set 1
                    br 6 (;@2;)
                  end
                end
              end
              local.get 2
              local.get 3
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              local.get 3
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
              local.get 2
              local.get 3
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=2
              local.get 2
              i32.const 3
              i32.add
            end
          end
          local.set 2
          local.get 1
          i32.const 2
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
      global.get 13
      i32.const 8
      i32.add
      global.set 13
      global.get 13
      i32.const 4
      i32.add
      global.set 13
      local.get 0
      return
    end
    i32.const 37120
    i32.const 37168
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;21;) (type 1) (param i32)
    global.get 13
    i32.const 8
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i64.const 0
    i64.store
    global.get 13
    local.get 0
    i32.store
    i32.const 1
    global.set 11
    global.get 13
    local.get 0
    call 20
    local.tee 0
    i32.store offset=4
    global.get 13
    local.get 0
    i32.store
    local.get 0
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    call 1
    global.get 13
    i32.const 8
    i32.add
    global.set 13)
  (func (;22;) (type 0) (param i32) (result i32)
    global.get 13
    i32.const 4
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i32.const 0
    i32.store
    global.get 13
    local.get 0
    i32.store
    local.get 0
    i32.load offset=8
    local.set 0
    global.get 13
    i32.const 4
    i32.add
    global.set 13
    local.get 0)
  (func (;23;) (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 13
    i32.const 24
    i32.sub
    global.set 13
    block  ;; label = @1
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.const 24
      memory.fill
      global.get 13
      local.set 1
      global.get 13
      local.get 0
      call 26
      local.tee 2
      i32.store
      global.get 13
      i32.const 1856
      i32.store offset=4
      global.get 13
      local.get 2
      i32.store offset=8
      i32.const 1860
      local.get 2
      i32.store
      i32.const 1856
      local.get 2
      i32.const 1
      call 12
      global.get 13
      i32.const 1856
      i32.store offset=4
      global.get 13
      i32.const 3664
      i32.store offset=8
      local.get 1
      i32.const 1856
      call 19
      local.tee 1
      i32.store offset=12
      global.get 13
      local.get 1
      i32.store offset=4
      local.get 1
      call 21
      local.get 0
      call 16
      global.set 10
      global.get 13
      global.get 10
      local.tee 0
      i32.store offset=8
      global.get 13
      local.get 0
      i32.load
      local.tee 0
      i32.store offset=4
      i32.const 1
      global.set 11
      local.get 0
      call 17
      global.set 12
      global.get 13
      i32.const 1056
      i32.store offset=4
      i32.const 26
      i32.const 1052
      i32.load
      i32.const 1
      i32.shr_u
      local.tee 0
      local.get 0
      i32.const 26
      i32.gt_u
      select
      local.set 1
      global.get 13
      i32.const 1056
      i32.store offset=4
      i32.const 1
      global.set 11
      global.get 13
      i32.const 1056
      call 20
      local.tee 2
      i32.store offset=16
      global.get 13
      local.set 3
      global.get 13
      local.get 2
      i32.store offset=4
      i32.const 1
      global.set 11
      global.get 13
      i32.const 4
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.store
      global.get 13
      local.get 2
      i32.store
      global.get 13
      i32.const 12
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      i32.const 0
      i32.store offset=8
      global.get 13
      local.get 2
      i32.store
      global.get 13
      local.get 2
      i32.store offset=4
      local.get 2
      i32.const 20
      i32.sub
      i32.load offset=16
      local.set 4
      global.get 13
      i32.const 12
      i32.const 5
      call 11
      local.tee 0
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store
      local.get 0
      local.get 2
      i32.const 0
      call 12
      local.get 0
      local.get 4
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store offset=4
      global.get 13
      i32.const 12
      i32.add
      global.set 13
      global.get 13
      i32.const 4
      i32.add
      global.set 13
      local.get 3
      local.get 0
      i32.store offset=20
      global.get 13
      global.get 10
      local.tee 2
      i32.store offset=4
      global.get 13
      local.get 0
      i32.store offset=8
      global.get 13
      i32.const 12
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i64.const 0
      i64.store
      global.get 13
      i32.const 0
      i32.store offset=8
      global.get 13
      local.get 2
      i32.store
      global.get 13
      local.get 0
      i32.store offset=4
      global.get 13
      local.get 0
      i32.store offset=8
      local.get 0
      call 22
      local.set 3
      global.get 13
      local.get 2
      i32.store offset=8
      local.get 2
      call 22
      local.get 3
      i32.lt_s
      if  ;; label = @2
        i32.const 1472
        i32.const 3808
        i32.const 1902
        i32.const 5
        call 0
        unreachable
      end
      global.get 13
      local.get 2
      i32.store offset=8
      local.get 2
      i32.load offset=4
      local.set 2
      global.get 13
      local.get 0
      i32.store offset=8
      local.get 2
      local.get 0
      i32.load offset=4
      local.get 3
      memory.copy
      global.get 13
      i32.const 12
      i32.add
      global.set 13
      global.get 13
      global.get 10
      local.tee 0
      i32.store offset=4
      global.get 13
      i32.const 4
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.store
      global.get 13
      local.get 0
      i32.store
      local.get 0
      i32.load offset=4
      local.set 2
      global.get 13
      local.get 0
      i32.store
      local.get 0
      call 22
      local.tee 0
      local.get 1
      i32.add
      local.get 1
      local.get 0
      local.get 0
      local.get 1
      i32.gt_s
      select
      local.get 1
      i32.const 0
      i32.lt_s
      select
      local.tee 1
      i32.const 26
      local.get 0
      local.get 0
      i32.const 26
      i32.gt_s
      select
      local.tee 0
      i32.lt_s
      if  ;; label = @2
        local.get 1
        local.get 2
        i32.add
        i32.const 0
        local.get 0
        local.get 1
        i32.sub
        memory.fill
      end
      global.get 13
      i32.const 4
      i32.add
      global.set 13
      i32.const 26
      local.set 1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        global.get 13
        i32.const 1120
        i32.store offset=4
        global.get 13
        i32.const 4
        i32.sub
        global.set 13
        global.get 13
        i32.const 4324
        i32.lt_s
        br_if 1 (;@1;)
        global.get 13
        i32.const 0
        i32.store
        global.get 13
        i32.const 1120
        i32.store
        i32.const 1132
        i32.load
        local.set 2
        global.get 13
        i32.const 4
        i32.add
        global.set 13
        local.get 0
        local.get 2
        i32.lt_s
        if  ;; label = @3
          global.get 13
          global.get 12
          local.tee 2
          i32.store offset=4
          global.get 13
          i32.const 1120
          i32.store offset=8
          global.get 13
          i32.const 4
          i32.sub
          global.set 13
          global.get 13
          i32.const 4324
          i32.lt_s
          br_if 2 (;@1;)
          global.get 13
          i32.const 0
          i32.store
          global.get 13
          i32.const 1120
          i32.store
          local.get 0
          i32.const 1132
          i32.load
          i32.ge_u
          if  ;; label = @4
            i32.const 1472
            i32.const 3872
            i32.const 114
            i32.const 42
            call 0
            unreachable
          end
          global.get 13
          i32.const 1120
          i32.store
          i32.const 1124
          i32.load
          local.get 0
          i32.const 1
          i32.shl
          i32.add
          i32.load16_u
          local.set 3
          global.get 13
          i32.const 4
          i32.add
          global.set 13
          global.get 13
          i32.const 4
          i32.sub
          global.set 13
          global.get 13
          i32.const 4324
          i32.lt_s
          br_if 2 (;@1;)
          global.get 13
          i32.const 0
          i32.store
          global.get 13
          local.get 2
          i32.store
          local.get 1
          i32.const 31
          i32.shr_u
          local.get 2
          i32.load offset=8
          local.get 1
          i32.const 2
          i32.add
          i32.lt_s
          i32.or
          if  ;; label = @4
            i32.const 1472
            i32.const 1680
            i32.const 135
            i32.const 7
            call 0
            unreachable
          end
          global.get 13
          local.get 2
          i32.store
          local.get 1
          local.get 2
          i32.load offset=4
          i32.add
          local.get 3
          i32.store16
          global.get 13
          i32.const 4
          i32.add
          global.set 13
          local.get 1
          i32.const 2
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
      global.get 13
      global.get 10
      local.tee 0
      i32.store offset=4
      local.get 0
      i32.load offset=4
      local.set 0
      global.get 13
      i32.const 24
      i32.add
      global.set 13
      local.get 0
      return
    end
    i32.const 37120
    i32.const 37168
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;24;) (type 0) (param i32) (result i32)
    (local i32)
    global.get 13
    i32.const 20
    i32.sub
    global.set 13
    block  ;; label = @1
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.const 20
      memory.fill
      global.get 13
      global.get 12
      local.tee 1
      i32.store
      global.get 13
      i32.const 4
      i32.sub
      global.set 13
      global.get 13
      i32.const 4324
      i32.lt_s
      br_if 0 (;@1;)
      global.get 13
      i32.const 0
      i32.store
      global.get 13
      local.get 1
      i32.store
      local.get 0
      i32.const 31
      i32.shr_u
      local.get 1
      i32.load offset=8
      local.get 0
      i32.const 2
      i32.add
      i32.lt_s
      i32.or
      if  ;; label = @2
        i32.const 1472
        i32.const 1680
        i32.const 79
        i32.const 7
        call 0
        unreachable
      end
      global.get 13
      local.get 1
      i32.store
      local.get 0
      local.get 1
      i32.load offset=4
      i32.add
      i32.load16_u
      local.set 0
      global.get 13
      i32.const 4
      i32.add
      global.set 13
      local.get 0
      i32.const 65535
      i32.and
      local.tee 0
      i32.const 7
      i32.ne
      if  ;; label = @2
        global.get 13
        local.get 0
        call 26
        local.tee 0
        i32.store offset=4
        global.get 13
        i32.const 7
        call 26
        local.tee 1
        i32.store offset=8
        global.get 13
        i32.const 4080
        i32.store offset=12
        global.get 13
        local.get 0
        i32.store offset=16
        i32.const 4084
        local.get 0
        i32.store
        i32.const 4080
        local.get 0
        i32.const 1
        call 12
        global.get 13
        i32.const 4080
        i32.store offset=12
        global.get 13
        local.get 1
        i32.store offset=16
        i32.const 4092
        local.get 1
        i32.store
        i32.const 4080
        local.get 1
        i32.const 1
        call 12
        global.get 13
        i32.const 4080
        i32.store offset=12
        global.get 13
        i32.const 3664
        i32.store offset=16
        i32.const 4080
        call 19
        local.set 0
        global.get 13
        local.get 0
        i32.store
        local.get 0
        call 21
        global.get 13
        i32.const 20
        i32.add
        global.set 13
        i32.const 0
        return
      end
      global.get 13
      i32.const 20
      i32.add
      global.set 13
      i32.const 1
      return
    end
    i32.const 37120
    i32.const 37168
    i32.const 1
    i32.const 1
    call 0
    unreachable)
  (func (;25;) (type 2) (param i32 i32) (result i32)
    (local i64 i32)
    global.get 13
    i32.const 12
    i32.sub
    global.set 13
    block  ;; label = @1
      block  ;; label = @2
        global.get 13
        i32.const 4324
        i32.lt_s
        br_if 0 (;@2;)
        global.get 13
        i64.const 0
        i64.store
        global.get 13
        i32.const 0
        i32.store offset=8
        global.get 13
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
          i32.const 4128
          local.set 0
          global.get 13
          i32.const 4128
          i32.store
          br 2 (;@1;)
        end
        global.get 13
        global.get 10
        local.tee 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=8
        i32.gt_u
        if  ;; label = @3
          i32.const 4192
          local.set 0
          global.get 13
          i32.const 4192
          i32.store
          br 2 (;@1;)
        end
        global.get 13
        global.get 10
        local.tee 3
        i32.store
        global.get 13
        i32.const 4
        i32.sub
        global.set 13
        global.get 13
        i32.const 4324
        i32.lt_s
        br_if 0 (;@2;)
        global.get 13
        i32.const 0
        i32.store
        global.get 13
        local.get 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=8
        i32.ge_u
        if  ;; label = @3
          i32.const 1472
          i32.const 3808
          i32.const 167
          i32.const 45
          call 0
          unreachable
        end
        global.get 13
        local.get 3
        i32.store
        local.get 0
        local.get 3
        i32.load offset=4
        i32.add
        i32.load8_u
        local.set 0
        global.get 13
        i32.const 4
        i32.add
        global.set 13
        local.get 0
        i32.const 93
        i32.gt_u
        if  ;; label = @3
          i32.const 4240
          local.set 0
          global.get 13
          i32.const 4240
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        i64.extend_i32_u
        call 13
        local.set 2
        global.get 13
        global.get 10
        local.tee 0
        i32.store offset=4
        global.get 13
        local.get 0
        i32.load
        local.tee 0
        i32.store
        i32.const 1
        global.set 11
        global.get 13
        local.get 0
        call 17
        local.tee 0
        i32.store offset=8
        global.get 13
        local.get 0
        i32.store
        global.get 13
        i32.const 4
        i32.sub
        global.set 13
        global.get 13
        i32.const 4324
        i32.lt_s
        br_if 0 (;@2;)
        global.get 13
        i32.const 0
        i32.store
        global.get 13
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
          i32.const 1472
          i32.const 1680
          i32.const 174
          i32.const 7
          call 0
          unreachable
        end
        global.get 13
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.load offset=4
        i32.add
        local.get 2
        i64.store
        global.get 13
        i32.const 4
        i32.add
        global.set 13
        global.get 13
        i32.const 12
        i32.add
        global.set 13
        i32.const 1
        return
      end
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    local.get 0
    call 21
    global.get 13
    i32.const 12
    i32.add
    global.set 13
    i32.const 0)
  (func (;26;) (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    global.get 13
    i32.const 4
    i32.sub
    global.set 13
    global.get 13
    i32.const 4324
    i32.lt_s
    if  ;; label = @1
      i32.const 37120
      i32.const 37168
      i32.const 1
      i32.const 1
      call 0
      unreachable
    end
    global.get 13
    i32.const 0
    i32.store
    local.get 0
    i32.eqz
    if  ;; label = @1
      global.get 13
      i32.const 4
      i32.add
      global.set 13
      i32.const 2080
      return
    end
    global.get 13
    local.get 0
    i32.const 100000
    i32.lt_u
    if (result i32)  ;; label = @1
      local.get 0
      i32.const 100
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i32.const 10
        i32.ge_u
        i32.const 1
        i32.add
      else
        local.get 0
        i32.const 10000
        i32.ge_u
        i32.const 3
        i32.add
        local.get 0
        i32.const 1000
        i32.ge_u
        i32.add
      end
    else
      local.get 0
      i32.const 10000000
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i32.const 1000000
        i32.ge_u
        i32.const 6
        i32.add
      else
        local.get 0
        i32.const 1000000000
        i32.ge_u
        i32.const 8
        i32.add
        local.get 0
        i32.const 100000000
        i32.ge_u
        i32.add
      end
    end
    local.tee 1
    i32.const 1
    i32.shl
    i32.const 2
    call 11
    local.tee 2
    i32.store
    loop  ;; label = @1
      local.get 0
      i32.const 10000
      i32.ge_u
      if  ;; label = @2
        local.get 0
        i32.const 10000
        i32.rem_u
        local.set 3
        local.get 0
        i32.const 10000
        i32.div_u
        local.set 0
        local.get 2
        local.get 1
        i32.const 4
        i32.sub
        local.tee 1
        i32.const 1
        i32.shl
        i32.add
        local.get 3
        i32.const 100
        i32.div_u
        i32.const 2
        i32.shl
        i32.const 2092
        i32.add
        i64.load32_u
        local.get 3
        i32.const 100
        i32.rem_u
        i32.const 2
        i32.shl
        i32.const 2092
        i32.add
        i64.load32_u
        i64.const 32
        i64.shl
        i64.or
        i64.store
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 100
    i32.ge_u
    if  ;; label = @1
      local.get 2
      local.get 1
      i32.const 2
      i32.sub
      local.tee 1
      i32.const 1
      i32.shl
      i32.add
      local.get 0
      i32.const 100
      i32.rem_u
      i32.const 2
      i32.shl
      i32.const 2092
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 100
      i32.div_u
      local.set 0
    end
    local.get 0
    i32.const 10
    i32.ge_u
    if  ;; label = @1
      local.get 2
      local.get 1
      i32.const 2
      i32.sub
      i32.const 1
      i32.shl
      i32.add
      local.get 0
      i32.const 2
      i32.shl
      i32.const 2092
      i32.add
      i32.load
      i32.store
    else
      local.get 2
      local.get 1
      i32.const 1
      i32.sub
      i32.const 1
      i32.shl
      i32.add
      local.get 0
      i32.const 48
      i32.add
      i32.store16
    end
    global.get 13
    i32.const 4
    i32.add
    global.set 13
    local.get 2)
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
  (global (;11;) (mut i32) (i32.const 0))
  (global (;12;) (mut i32) (i32.const 0))
  (global (;13;) (mut i32) (i32.const 37092))
  (export "setup" (func 23))
  (export "receiveGameParams" (func 24))
  (export "runFib" (func 25))
  (export "memory" (memory 0))
  (start 15)
  (data (;0;) (i32.const 1036) "\1c")
  (data (;1;) (i32.const 1048) "\02\00\00\00\0c\00\00\00b\00o\00t\00_\00a\00s")
  (data (;2;) (i32.const 1068) "\1c")
  (data (;3;) (i32.const 1080) "\01\00\00\00\06\00\00\00\00\00\01")
  (data (;4;) (i32.const 1100) ",")
  (data (;5;) (i32.const 1112) "\04\00\00\00\10\00\00\00@\04\00\00@\04\00\00\06\00\00\00\03")
  (data (;6;) (i32.const 1148) ",")
  (data (;7;) (i32.const 1160) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
  (data (;8;) (i32.const 1196) "<")
  (data (;9;) (i32.const 1208) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
  (data (;10;) (i32.const 1260) "<")
  (data (;11;) (i32.const 1272) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
  (data (;12;) (i32.const 1324) "<")
  (data (;13;) (i32.const 1336) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00r\00t\00/\00i\00t\00c\00m\00s\00.\00t\00s")
  (data (;14;) (i32.const 1452) "<")
  (data (;15;) (i32.const 1464) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
  (data (;16;) (i32.const 1516) ",")
  (data (;17;) (i32.const 1528) "\02\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s")
  (data (;18;) (i32.const 1596) "<")
  (data (;19;) (i32.const 1608) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s")
  (data (;20;) (i32.const 1660) "<")
  (data (;21;) (i32.const 1672) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s")
  (data (;22;) (i32.const 1724) "<")
  (data (;23;) (i32.const 1736) "\02\00\00\00(\00\00\00R\00e\00s\00e\00r\00v\00i\00n\00g\00 \00s\00p\00a\00c\00e\00 \00f\00o\00r\00 ")
  (data (;24;) (i32.const 1788) ",")
  (data (;25;) (i32.const 1800) "\02\00\00\00\0e\00\00\00 \00b\00y\00t\00e\00s\00.")
  (data (;26;) (i32.const 1836) "\1c\00\00\00\03\00\00\00\00\00\00\00\07\00\00\00\0c\00\00\00\d0\06\00\00\00\00\00\00\10\07")
  (data (;27;) (i32.const 1868) "|")
  (data (;28;) (i32.const 1880) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
  (data (;29;) (i32.const 1996) "<")
  (data (;30;) (i32.const 2008) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
  (data (;31;) (i32.const 2060) "\1c")
  (data (;32;) (i32.const 2072) "\02\00\00\00\02\00\00\000")
  (data (;33;) (i32.const 2092) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
  (data (;34;) (i32.const 2492) "\1c\04")
  (data (;35;) (i32.const 2504) "\02\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
  (data (;36;) (i32.const 3548) "\5c")
  (data (;37;) (i32.const 3560) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
  (data (;38;) (i32.const 3644) "\1c")
  (data (;39;) (i32.const 3656) "\02")
  (data (;40;) (i32.const 3676) "<")
  (data (;41;) (i32.const 3688) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
  (data (;42;) (i32.const 3740) ",")
  (data (;43;) (i32.const 3752) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
  (data (;44;) (i32.const 3788) "<")
  (data (;45;) (i32.const 3800) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;46;) (i32.const 3852) ",")
  (data (;47;) (i32.const 3864) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;48;) (i32.const 3900) "\5c")
  (data (;49;) (i32.const 3912) "\02\00\00\00>\00\00\00E\00R\00R\00O\00R\00:\00 \00C\00a\00n\00'\00t\00 \00p\00a\00r\00s\00e\00 \00G\00a\00m\00e\00P\00a\00r\00a\00m\00s\00 \00v")
  (data (;50;) (i32.const 3996) "<")
  (data (;51;) (i32.const 4008) "\02\00\00\00*\00\00\00;\00 \00o\00n\00l\00y\00 \00p\00r\00e\00p\00a\00r\00e\00d\00 \00f\00o\00r\00 \00v")
  (data (;52;) (i32.const 4060) ",\00\00\00\03\00\00\00\00\00\00\00\07\00\00\00\10\00\00\00P\0f\00\00\00\00\00\00\b0\0f")
  (data (;53;) (i32.const 4108) "<")
  (data (;54;) (i32.const 4120) "\02\00\00\00*\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00e\00s\00u\00l\00t\00 \00o\00f\00f\00s\00e\00t")
  (data (;55;) (i32.const 4172) ",")
  (data (;56;) (i32.const 4184) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00o\00f\00f\00s\00e\00t")
  (data (;57;) (i32.const 4220) "<")
  (data (;58;) (i32.const 4232) "\02\00\00\00$\00\00\00F\00i\00b\00 \00i\00n\00d\00e\00x\00 \00t\00o\00o\00 \00h\00i\00g\00h")
  (data (;59;) (i32.const 4288) "\08\00\00\00 \00\00\00 \00\00\00 \00\00\00\00\00\00\00\82\00\00\00A\00\00\00\00\00\00\00\04A"))
