(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32 i32)))
  (type (;2;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32) (result i32)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32)))
  (type (;8;) (func (param i64) (result i64)))
  (type (;9;) (func (param i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32) (result i64)))
  (type (;11;) (func (param i32 i64 i64 i64 i64)))
  (import "env" "logFunction" (func (;0;) (type 4)))
  (func (;1;) (type 5) (param i32) (result i32)
    (local i32 i64 i32 i32 i32 i32)
    global.get 0
    i32.const 304
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 8
    i32.add
    i32.const 1048588
    i32.const 232
    call 43
    drop
    i32.const 0
    i32.const 1049180
    i32.store offset=1049292
    i32.const 0
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=1049288
    local.get 1
    local.get 0
    i32.store offset=240
    local.get 1
    i32.const 1
    i32.store offset=284
    local.get 1
    i64.const 0
    i64.store offset=296
    local.get 1
    local.get 1
    i32.const 292
    i32.add
    i32.store offset=280
    local.get 1
    local.get 1
    i32.const 296
    i32.add
    i32.store offset=292
    local.get 1
    i32.const 280
    i32.add
    local.get 1
    i32.const 240
    i32.add
    call 3
    drop
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i64.load offset=296
        local.tee 2
        i64.const 4294967295
        i64.gt_u
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i64.load offset=1049288
        i64.store offset=256
        local.get 1
        i32.const 268
        i32.add
        local.get 1
        i32.const 256
        i32.add
        local.get 2
        i32.wrap_i64
        call 4
        local.get 1
        i32.load16_u offset=276
        br_if 0 (;@2;)
        local.get 1
        i64.load offset=268 align=4
        local.set 2
        local.get 1
        i32.const 2
        i32.store offset=300
        i32.const 0
        local.set 3
        local.get 1
        i32.const 0
        i32.store offset=288
        local.get 1
        local.get 2
        i64.store offset=280 align=4
        local.get 1
        local.get 1
        i32.const 292
        i32.add
        i32.store offset=296
        local.get 1
        local.get 1
        i32.const 280
        i32.add
        i32.store offset=292
        local.get 1
        i32.const 296
        i32.add
        local.get 1
        i32.const 240
        i32.add
        call 3
        drop
        local.get 1
        i32.load offset=280
        local.tee 4
        local.get 1
        i32.load offset=288
        local.tee 5
        call 0
        local.get 1
        i32.const 244
        i32.add
        i32.const 1049288
        local.get 0
        call 4
        local.get 1
        i32.load16_u offset=252
        br_if 1 (;@1;)
        i32.const 0
        local.get 1
        i32.load offset=244
        local.tee 6
        i32.store offset=1049296
        i32.const 0
        local.get 1
        i32.load offset=248
        i32.store offset=1049300
        local.get 6
        i64.const 0
        i64.store offset=7 align=1
        local.get 6
        i32.const 0
        i32.load offset=1048934 align=1
        i32.store align=1
        local.get 6
        i32.const 3
        i32.add
        i32.const 0
        i32.load offset=1048937 align=1
        i32.store align=1
        local.get 6
        i32.const 15
        i32.add
        i64.const 0
        i64.store align=1
        local.get 6
        i32.const 22
        i32.add
        i32.const 0
        i32.store align=1
        local.get 6
        i32.const 26
        i32.add
        local.set 0
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            i32.const 6
            i32.eq
            br_if 1 (;@3;)
            local.get 0
            local.get 3
            i32.add
            local.get 3
            i32.const 1049174
            i32.add
            i32.load16_u
            i32.store16 align=1
            local.get 3
            i32.const 2
            i32.add
            local.set 3
            br 0 (;@4;)
          end
        end
        local.get 4
        local.get 5
        call 6
        local.get 1
        i32.const 304
        i32.add
        global.set 0
        local.get 6
        return
      end
      loop  ;; label = @2
        unreachable
        br 0 (;@2;)
      end
    end
    loop (result i32)  ;; label = @1
      unreachable
      br 0 (;@1;)
    end)
  (func (;2;) (type 3) (param i32 i32 i32 i32)
    (local i64)
    local.get 0
    local.get 3
    i64.extend_i32_u
    local.tee 4
    i64.store align=4
    local.get 1
    i32.load
    local.tee 3
    local.get 3
    i64.load
    local.get 4
    i64.add
    i64.store)
  (func (;3;) (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i64.load align=4
    i64.store offset=8
    block  ;; label = @1
      local.get 2
      i32.const 8
      i32.add
      i32.const 1049143
      i32.const 20
      call 33
      local.tee 3
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 3
      i32.const 32
      local.set 1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          i32.const 100
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          i32.const 31
          i32.add
          local.get 1
          i32.add
          i32.const -1
          i32.add
          local.get 3
          local.get 3
          i32.const 100
          i32.div_u
          local.tee 4
          i32.const 100
          i32.mul
          i32.sub
          i32.const 1
          i32.shl
          i32.const 1048942
          i32.add
          i32.load16_u align=1
          i32.store16 align=1
          local.get 1
          i32.const -2
          i32.add
          local.set 1
          local.get 4
          local.set 3
          br 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 9
          i32.gt_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 31
          i32.add
          local.get 1
          i32.add
          local.get 3
          i32.const 48
          i32.or
          i32.store8
          br 1 (;@2;)
        end
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        local.get 2
        i32.const 31
        i32.add
        i32.add
        local.get 3
        i32.const 1
        i32.shl
        i32.const 1048942
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
      end
      local.get 2
      i32.const 31
      i32.add
      local.get 1
      i32.add
      i32.const 33
      local.get 1
      i32.sub
      i32.const 1049200
      local.get 0
      call 34
      local.tee 3
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i64.load align=4
      i64.store offset=16
      local.get 2
      i32.const 16
      i32.add
      i32.const 1049166
      i32.const 7
      call 33
      local.set 3
    end
    local.get 2
    i32.const 64
    i32.add
    global.set 0
    local.get 3)
  (func (;4;) (type 7) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const -1
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          i64.load align=4
          local.tee 4
          i32.wrap_i64
          local.get 2
          i32.const 0
          i32.const 0
          local.get 4
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          i32.load
          call_indirect (type 0)
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        local.get 2
        i32.store offset=20
        local.get 3
        local.get 1
        i32.store offset=16
        local.get 3
        i32.const 0
        i32.store16 offset=24
        local.get 3
        i32.const 16
        i32.add
        local.set 2
        br 1 (;@1;)
      end
      local.get 3
      i32.const 1
      i32.store16 offset=12
      local.get 3
      i32.const 4
      i32.add
      local.set 2
    end
    local.get 0
    local.get 2
    i64.load align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func (;5;) (type 3) (param i32 i32 i32 i32)
    (local i64 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i64.const 0
        local.set 4
        br 1 (;@1;)
      end
      i64.const 8589934592
      local.set 4
      local.get 1
      i32.load
      local.tee 1
      i32.load offset=4
      local.tee 5
      local.get 1
      i32.load offset=8
      local.tee 6
      i32.le_u
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.get 6
      i32.add
      local.get 2
      local.get 5
      local.get 6
      i32.sub
      local.tee 6
      local.get 3
      local.get 6
      local.get 3
      i32.lt_u
      select
      local.tee 3
      call 43
      drop
      local.get 1
      local.get 1
      i32.load offset=8
      local.get 3
      i32.add
      i32.store offset=8
      local.get 3
      i64.extend_i32_u
      local.set 4
    end
    local.get 0
    local.get 4
    i64.store align=4)
  (func (;6;) (type 4) (param i32 i32)
    (local i32 i64)
    block  ;; label = @1
      local.get 1
      i32.const 0
      local.get 1
      select
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i64.load offset=1049288
      local.tee 3
      i32.wrap_i64
      local.get 0
      i32.const -1431655766
      local.get 1
      select
      local.get 2
      i32.const 0
      i32.const 0
      local.get 3
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.load offset=8
      call_indirect (type 1)
    end)
  (func (;7;) (type 5) (param i32) (result i32)
    (local i32 i64 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049296
        local.get 0
        i32.add
        i32.load16_u align=1
        local.tee 0
        i32.const 7
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        i32.store16 offset=14
        local.get 1
        i32.const 1
        i32.store offset=44
        local.get 1
        i64.const 0
        i64.store offset=56
        local.get 1
        local.get 1
        i32.const 52
        i32.add
        i32.store offset=40
        local.get 1
        local.get 1
        i32.const 56
        i32.add
        i32.store offset=52
        local.get 1
        i32.const 40
        i32.add
        local.get 1
        i32.const 14
        i32.add
        call 8
        drop
        local.get 1
        i64.load offset=56
        local.tee 2
        i64.const 4294967295
        i64.gt_u
        br_if 1 (;@1;)
        local.get 1
        i32.const 0
        i64.load offset=1049288
        i64.store offset=16
        local.get 1
        i32.const 28
        i32.add
        local.get 1
        i32.const 16
        i32.add
        local.get 2
        i32.wrap_i64
        call 4
        local.get 1
        i32.load16_u offset=36
        br_if 1 (;@1;)
        local.get 1
        i64.load offset=28 align=4
        local.set 2
        local.get 1
        i32.const 2
        i32.store offset=60
        local.get 1
        i32.const 0
        i32.store offset=48
        local.get 1
        local.get 2
        i64.store offset=40 align=4
        local.get 1
        local.get 1
        i32.const 52
        i32.add
        i32.store offset=56
        local.get 1
        local.get 1
        i32.const 40
        i32.add
        i32.store offset=52
        local.get 1
        i32.const 56
        i32.add
        local.get 1
        i32.const 14
        i32.add
        call 8
        drop
        local.get 1
        i32.load offset=40
        local.tee 3
        local.get 1
        i32.load offset=48
        local.tee 4
        call 0
        local.get 3
        local.get 4
        call 6
      end
      local.get 1
      i32.const 64
      i32.add
      global.set 0
      local.get 0
      i32.const 7
      i32.eq
      return
    end
    loop (result i32)  ;; label = @1
      unreachable
      br 0 (;@1;)
    end)
  (func (;8;) (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i64.load align=4
    i64.store
    block  ;; label = @1
      local.get 2
      i32.const 1048820
      i32.const 31
      call 33
      local.tee 3
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 1
      i32.load16_u
      local.get 0
      call 35
      local.tee 3
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i64.load align=4
      i64.store offset=8
      local.get 2
      i32.const 8
      i32.add
      i32.const 1048854
      i32.const 21
      call 33
      local.tee 3
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      i32.const 7
      local.get 0
      call 35
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 3)
  (func (;9;) (type 6) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      local.get 1
      i32.const 8
      i32.add
      i32.const 0
      i32.load offset=1049300
      local.tee 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 1048878
      i32.const 21
      call 0
      i32.const 0
      return
    end
    block  ;; label = @1
      local.get 2
      local.get 0
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 1048900
      i32.const 14
      call 0
      i32.const 0
      return
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1049296
      local.tee 2
      local.get 0
      i32.add
      i64.load8_u
      local.tee 3
      i64.const 94
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 1048915
      i32.const 18
      call 0
      i32.const 0
      return
    end
    local.get 2
    local.get 1
    i32.add
    local.get 3
    call 10
    i64.store align=1
    i32.const 1)
  (func (;10;) (type 8) (param i64) (result i64)
    (local i64)
    i64.const 0
    local.set 1
    loop (result i64)  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 1
        i64.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i64.add
        return
      end
      local.get 0
      i64.const -2
      i64.add
      call 10
      local.get 1
      i64.add
      local.set 1
      local.get 0
      i64.const -1
      i64.add
      local.set 0
      br 0 (;@1;)
    end)
  (func (;11;) (type 9) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 0
    i32.load offset=4
    local.set 4
    local.get 0
    i32.load
    local.set 5
    i32.const 0
    local.set 6
    local.get 2
    i32.const 255
    i32.and
    local.set 7
    loop (result i32)  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            i32.const -1
            local.set 8
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 5
            local.get 6
            i32.const 4
            i32.shl
            i32.add
            local.tee 2
            i32.const 8
            i32.add
            i64.load
            local.tee 9
            i64.const 0
            i64.lt_s
            br_if 0 (;@4;)
            local.get 2
            i64.load
            i64.popcnt
            local.get 9
            i64.popcnt
            i64.add
            i32.wrap_i64
            local.get 1
            i32.lt_u
            br_if 2 (;@2;)
          end
          local.get 6
          i32.const 7
          i32.shl
          local.tee 8
          i32.const 128
          i32.add
          local.set 10
          loop  ;; label = @4
            local.get 8
            local.get 10
            i32.ge_u
            br_if 2 (;@2;)
            local.get 8
            local.get 0
            i64.load align=4
            local.tee 9
            i64.const 25
            i64.shr_u
            i32.wrap_i64
            i32.const -128
            i32.and
            local.tee 2
            local.get 8
            local.get 2
            i32.gt_u
            select
            local.tee 11
            local.get 8
            i32.sub
            local.set 12
            local.get 9
            i32.wrap_i64
            local.set 13
            i32.const 0
            local.set 2
            local.get 8
            i32.const 16
            i32.shl
            i32.ctz
            local.get 7
            i32.lt_u
            local.set 14
            block  ;; label = @5
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 12
                  local.get 2
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 11
                  local.set 15
                  br 2 (;@5;)
                end
                i32.const 255
                local.get 8
                local.get 2
                i32.add
                local.tee 15
                i32.const 7
                i32.and
                local.tee 16
                i32.const 7
                i32.xor
                i32.shr_u
                i32.const 1
                local.get 16
                i32.shl
                i32.and
                local.get 13
                local.get 15
                i32.const 3
                i32.shr_u
                i32.add
                i32.load8_u
                i32.and
                i32.eqz
                br_if 1 (;@5;)
                local.get 2
                i32.const 1
                i32.add
                local.tee 2
                local.get 1
                i32.lt_u
                br_if 0 (;@6;)
                local.get 14
                br_if 0 (;@6;)
              end
              local.get 3
              local.get 9
              i64.store offset=8
              local.get 3
              i32.const 8
              i32.add
              local.get 8
              local.get 1
              i32.const 0
              call 12
              br 2 (;@3;)
            end
            local.get 15
            i32.const 1
            i32.add
            local.set 8
            br 0 (;@4;)
          end
        end
        local.get 3
        i32.const 16
        i32.add
        global.set 0
        local.get 8
        return
      end
      local.get 6
      i32.const 1
      i32.add
      local.set 6
      br 0 (;@1;)
    end)
  (func (;12;) (type 3) (param i32 i32 i32 i32)
    (local i32)
    local.get 3
    i32.const 1
    i32.and
    local.set 4
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        i32.const -1431655766
        local.get 0
        i32.load offset=4
        select
        local.get 1
        i32.const 3
        i32.shr_u
        i32.add
        local.tee 3
        local.get 3
        i32.load8_u
        i32.const -2
        local.get 1
        i32.const 7
        i32.and
        local.tee 3
        i32.rotl
        i32.and
        local.get 4
        local.get 3
        i32.shl
        i32.or
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        br 0 (;@2;)
      end
    end)
  (func (;13;) (type 4) (param i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.const 2048
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 1049192
      local.get 0
      local.get 1
      i32.const 2048
      local.get 1
      i32.const 2048
      i32.lt_u
      select
      local.get 0
      i32.sub
      call 14
    end
    block  ;; label = @1
      local.get 1
      i32.const 2048
      i32.le_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049284
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4096
        i32.store offset=1049284
        i32.const 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        i32.const 16
        i32.shl
        local.tee 3
        i32.store offset=1049280
        local.get 3
        i32.const 0
        i32.const 65536
        call 42
        drop
      end
      local.get 2
      i32.const 0
      i64.load offset=1049280
      i64.store offset=8
      local.get 2
      i32.const 8
      i32.add
      local.get 0
      i32.const 2048
      local.get 0
      i32.const 2048
      i32.gt_u
      select
      local.tee 0
      i32.const -2048
      i32.add
      local.get 1
      local.get 0
      i32.sub
      call 14
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;14;) (type 7) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 0
    i64.load align=4
    i64.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    i32.const 1
    call 12
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;15;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.const -65535
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 1049192
        local.get 1
        i32.const 65535
        i32.add
        i32.const 16
        i32.shr_u
        local.tee 1
        local.get 2
        call 11
        local.tee 4
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 1049280
          local.get 1
          local.get 2
          call 11
          local.tee 4
          i32.const -1
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          i32.const 2048
          i32.add
          local.set 4
          br 1 (;@2;)
        end
        i32.const 0
        local.set 4
        i32.const 1
        local.get 2
        i32.shl
        local.tee 5
        memory.size
        local.tee 6
        i32.const 16
        i32.shl
        local.tee 2
        i32.add
        i32.const -1
        i32.add
        i32.const 0
        local.get 5
        i32.sub
        i32.and
        local.tee 5
        local.get 2
        i32.sub
        i32.const 16
        i32.shr_u
        local.tee 7
        local.get 1
        i32.add
        memory.grow
        i32.const 1
        i32.lt_s
        br_if 1 (;@1;)
        local.get 7
        local.get 6
        i32.add
        local.set 4
        local.get 5
        local.get 2
        i32.eq
        br_if 0 (;@2;)
        local.get 6
        local.get 4
        call 13
      end
      local.get 4
      i32.const 16
      i32.shl
      local.set 4
    end
    local.get 4)
  (func (;16;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.const 65535
      i32.add
      local.tee 6
      i32.const -65536
      i32.and
      local.get 4
      i32.ge_u
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 65535
      i32.add
      i32.const 16
      i32.shr_u
      local.tee 4
      local.get 6
      i32.const 16
      i32.shr_u
      local.tee 6
      i32.eq
      br_if 0 (;@1;)
      local.get 4
      local.get 1
      i32.const 65535
      i32.add
      i32.const 16
      i32.shr_u
      local.tee 1
      i32.add
      local.get 1
      local.get 6
      i32.add
      call 13
    end
    local.get 2)
  (func (;17;) (type 1) (param i32 i32 i32 i32 i32)
    local.get 1
    i32.const 65535
    i32.add
    i32.const 16
    i32.shr_u
    local.tee 1
    local.get 1
    local.get 2
    i32.const 65535
    i32.add
    i32.const 16
    i32.shr_u
    i32.add
    call 13)
  (func (;18;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const 1
                local.get 2
                i32.shl
                local.tee 5
                local.get 1
                local.get 5
                i32.gt_u
                select
                local.tee 5
                i32.const 32769
                i32.lt_u
                br_if 0 (;@6;)
                local.get 0
                i32.const 208
                i32.add
                i32.load
                br_if 3 (;@3;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=200
                    local.tee 5
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 5
                    br 1 (;@7;)
                  end
                  local.get 5
                  i32.const -4
                  i32.add
                  i32.load
                  i64.extend_i32_u
                  i64.const 80
                  i64.mul
                  local.tee 6
                  local.get 6
                  i64.const 100
                  i64.rem_u
                  i64.sub
                  i64.const 100
                  i64.add
                  i64.const 80
                  i64.div_u
                  i32.wrap_i64
                  local.set 5
                end
                local.get 4
                local.get 0
                i64.load align=4
                i64.store offset=48
                local.get 4
                i32.const 8
                i32.add
                local.get 4
                i32.const 48
                i32.add
                i64.const 1
                i32.const 32
                local.get 5
                i32.clz
                i32.sub
                i64.extend_i32_u
                i64.const 65535
                i64.and
                i64.shl
                i32.wrap_i64
                local.tee 5
                i32.const 8
                local.get 5
                i32.const 8
                i32.gt_u
                select
                local.tee 5
                i32.const 15
                i32.add
                local.tee 7
                local.get 5
                i32.const 2
                i32.shl
                i32.add
                local.tee 8
                local.get 5
                i32.const 3
                i32.shl
                i32.add
                i32.const -4
                i32.and
                call 19
                local.get 4
                i32.load16_u offset=16
                br_if 4 (;@2;)
                local.get 4
                i32.load offset=8
                local.tee 9
                i32.const 8
                i32.add
                local.get 5
                i32.store
                local.get 9
                i32.const 4
                i32.add
                local.get 9
                local.get 7
                i32.const -4
                i32.and
                i32.add
                i32.store
                local.get 9
                local.get 9
                local.get 8
                i32.const -4
                i32.and
                i32.add
                i32.store
                i32.const 0
                local.set 10
                local.get 9
                i32.const 12
                i32.add
                i32.const 0
                local.get 5
                call 42
                local.set 8
                local.get 5
                i64.extend_i32_u
                i64.const 80
                i64.mul
                i64.const 100
                i64.div_u
                i32.wrap_i64
                local.set 11
                local.get 0
                i32.load offset=200
                local.set 12
                local.get 0
                i32.load offset=204
                i32.eqz
                br_if 2 (;@4;)
                i32.const 0
                local.set 10
                i32.const 0
                local.set 13
                block  ;; label = @7
                  local.get 12
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 12
                  i32.const -4
                  i32.add
                  i32.load
                  local.set 13
                end
                local.get 12
                i32.const -12
                i32.add
                local.tee 5
                i32.load
                local.set 14
                local.get 5
                i32.const 4
                i32.add
                i32.load
                local.set 15
                local.get 9
                i32.const 8
                i32.add
                local.set 16
                i32.const 0
                local.set 17
                loop  ;; label = @7
                  local.get 17
                  local.get 13
                  i32.eq
                  br_if 2 (;@5;)
                  block  ;; label = @8
                    local.get 12
                    local.get 17
                    i32.add
                    i32.load8_s
                    i32.const -1
                    i32.gt_s
                    br_if 0 (;@8;)
                    local.get 14
                    local.get 17
                    i32.const 3
                    i32.shl
                    i32.add
                    i64.load align=4
                    local.set 18
                    local.get 15
                    local.get 17
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.load
                    local.tee 19
                    call 20
                    local.set 6
                    local.get 16
                    i32.load
                    local.tee 20
                    i32.const -1
                    i32.add
                    local.set 21
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 10
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 6
                        i64.const 57
                        i64.shr_u
                        i32.wrap_i64
                        local.set 22
                        local.get 21
                        local.get 6
                        i32.wrap_i64
                        i32.and
                        local.tee 5
                        local.set 7
                        loop  ;; label = @11
                          local.get 8
                          local.get 7
                          i32.add
                          i32.load8_s
                          local.tee 23
                          i32.eqz
                          br_if 2 (;@9;)
                          local.get 20
                          i32.eqz
                          br_if 2 (;@9;)
                          block  ;; label = @12
                            local.get 23
                            i32.const -1
                            i32.gt_s
                            br_if 0 (;@12;)
                            local.get 22
                            local.get 23
                            i32.const 127
                            i32.and
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 9
                            i32.const 4
                            i32.add
                            i32.load
                            local.get 7
                            i32.const 2
                            i32.shl
                            i32.add
                            i32.load
                            local.get 19
                            i32.eq
                            br_if 3 (;@9;)
                          end
                          local.get 20
                          i32.const -1
                          i32.add
                          local.set 20
                          local.get 7
                          i32.const 1
                          i32.add
                          local.get 21
                          i32.and
                          local.set 7
                          br 0 (;@11;)
                        end
                      end
                      local.get 21
                      local.get 6
                      i32.wrap_i64
                      i32.and
                      local.set 5
                    end
                    block  ;; label = @9
                      loop  ;; label = @10
                        local.get 8
                        local.get 5
                        i32.add
                        local.tee 7
                        i32.load8_s
                        i32.const -1
                        i32.gt_s
                        br_if 1 (;@9;)
                        local.get 5
                        i32.const 1
                        i32.add
                        local.get 21
                        i32.and
                        local.set 5
                        br 0 (;@10;)
                      end
                    end
                    local.get 7
                    local.get 6
                    i64.const 57
                    i64.shr_u
                    i32.wrap_i64
                    i32.const 128
                    i32.or
                    i32.store8
                    local.get 9
                    i32.const 4
                    i32.add
                    i32.load
                    local.get 5
                    i32.const 2
                    i32.shl
                    i32.add
                    local.get 19
                    i32.store
                    local.get 9
                    i32.load
                    local.get 5
                    i32.const 3
                    i32.shl
                    i32.add
                    local.get 18
                    i64.store align=4
                    local.get 11
                    i32.const -1
                    i32.add
                    local.set 11
                    local.get 10
                    i32.const 1
                    i32.add
                    local.tee 10
                    local.get 0
                    i32.load offset=204
                    i32.eq
                    br_if 3 (;@5;)
                  end
                  local.get 17
                  i32.const 1
                  i32.add
                  local.set 17
                  br 0 (;@7;)
                end
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i64.const 1
                    i32.const 32
                    local.get 5
                    i32.const -1
                    i32.add
                    i32.clz
                    i32.sub
                    i64.extend_i32_u
                    i64.const 65535
                    i64.and
                    i64.shl
                    i32.wrap_i64
                    local.tee 7
                    i32.ctz
                    local.tee 21
                    i32.const 2
                    i32.shl
                    i32.add
                    i32.const 136
                    i32.add
                    local.tee 20
                    i32.load
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 65536
                    local.get 7
                    i32.div_u
                    local.get 5
                    i32.load16_u offset=4
                    local.get 5
                    i32.const 6
                    i32.add
                    i32.load8_u
                    i32.const 16
                    i32.shl
                    i32.or
                    local.tee 8
                    i32.ne
                    br_if 1 (;@7;)
                  end
                  i32.const 0
                  br_if 5 (;@2;)
                  local.get 0
                  i64.load align=4
                  local.tee 6
                  i32.wrap_i64
                  i32.const 65536
                  i32.const 16
                  i32.const 0
                  local.get 6
                  i64.const 32
                  i64.shr_u
                  i32.wrap_i64
                  i32.load
                  call_indirect (type 0)
                  local.tee 8
                  i32.eqz
                  br_if 5 (;@2;)
                  local.get 4
                  i32.const 48
                  i32.add
                  local.get 0
                  i32.const 16
                  i32.const 65536
                  local.get 7
                  i32.div_u
                  i32.const 3
                  i32.shr_u
                  local.tee 23
                  i32.const 15
                  i32.add
                  i32.const 32764
                  i32.and
                  local.get 7
                  i32.const 8192
                  i32.gt_u
                  local.tee 17
                  select
                  call 19
                  block  ;; label = @8
                    local.get 4
                    i32.load16_u offset=56
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 0
                    i64.load align=4
                    local.tee 6
                    i32.wrap_i64
                    local.get 8
                    i32.const 65536
                    i32.const 16
                    i32.const 0
                    local.get 6
                    i64.const 32
                    i64.shr_u
                    i32.wrap_i64
                    i32.load offset=8
                    call_indirect (type 1)
                    br 6 (;@2;)
                  end
                  local.get 4
                  i32.load offset=48
                  local.tee 5
                  local.get 8
                  i32.store
                  local.get 5
                  i32.const 0
                  i32.store16 offset=4
                  local.get 5
                  i32.const 0
                  i32.store16 offset=8
                  local.get 5
                  i32.const 6
                  i32.add
                  i32.const 0
                  i32.store8
                  local.get 5
                  i32.const 10
                  i32.add
                  i32.const 0
                  i32.store8
                  local.get 4
                  i32.const 0
                  i32.store16 offset=40
                  local.get 4
                  i32.const 0
                  i32.store8 offset=42
                  local.get 4
                  i32.const 0
                  i32.store16 offset=32
                  local.get 4
                  i32.const 0
                  i32.store8 offset=34
                  local.get 5
                  i32.const 12
                  i32.add
                  i32.const 0
                  i32.const 1
                  local.get 23
                  local.get 17
                  select
                  call 42
                  drop
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.const 228
                      i32.add
                      i32.load
                      local.tee 8
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 8
                      i32.load
                      i32.store offset=228
                      br 1 (;@8;)
                    end
                    local.get 4
                    i32.const 1049256
                    i32.store offset=44
                    local.get 4
                    local.get 0
                    i32.const 212
                    i32.add
                    i32.store offset=40
                    local.get 4
                    i32.const 48
                    i32.add
                    local.get 4
                    i32.const 40
                    i32.add
                    i32.const 20
                    call 19
                    local.get 4
                    i32.load16_u offset=56
                    br_if 2 (;@6;)
                    local.get 4
                    i32.load offset=48
                    local.set 8
                  end
                  local.get 8
                  local.get 5
                  i32.store
                  local.get 4
                  i32.const 8
                  i32.add
                  local.get 0
                  local.get 21
                  i32.const 3
                  i32.shl
                  i32.add
                  i32.const 8
                  i32.add
                  local.get 5
                  call 21
                  local.get 4
                  i32.const 8
                  i32.add
                  local.get 8
                  call 22
                  local.get 20
                  local.get 8
                  i32.load
                  local.tee 5
                  i32.store
                  local.get 5
                  i32.load16_u offset=4
                  local.get 5
                  i32.const 6
                  i32.add
                  i32.load8_u
                  i32.const 16
                  i32.shl
                  i32.or
                  local.set 8
                end
                local.get 5
                local.get 8
                i32.const 1
                i32.add
                local.tee 21
                i32.store16 offset=4
                local.get 5
                i32.const 6
                i32.add
                local.get 21
                i32.const 131071
                i32.and
                i32.const 16
                i32.shr_u
                i32.store8
                local.get 5
                local.get 8
                i32.const 3
                i32.shr_u
                i32.add
                local.tee 21
                i32.const 1
                local.get 8
                i32.const 7
                i32.and
                i32.shl
                local.get 21
                i32.load8_u offset=12
                i32.or
                i32.store8 offset=12
                local.get 5
                local.get 5
                i32.load16_u offset=8
                local.get 5
                i32.const 10
                i32.add
                local.tee 21
                i32.load8_u
                i32.const 16
                i32.shl
                i32.or
                i32.const 1
                i32.add
                local.tee 20
                i32.store16 offset=8
                local.get 21
                local.get 20
                i32.const 65536
                i32.and
                i32.const 16
                i32.shr_u
                i32.store8
                local.get 5
                i32.load
                local.get 8
                local.get 7
                i32.mul
                i32.add
                local.set 17
                br 5 (;@1;)
              end
              local.get 0
              local.get 5
              local.get 7
              call 23
              br 3 (;@2;)
            end
            local.get 0
            i32.load offset=200
            local.set 12
          end
          local.get 0
          local.get 11
          i32.store offset=208
          local.get 0
          local.get 10
          i32.store offset=204
          local.get 0
          local.get 8
          i32.store offset=200
          local.get 12
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 0
          i64.load align=4
          i64.store offset=8
          local.get 4
          i32.const 8
          i32.add
          local.get 12
          i32.const -12
          i32.add
          local.tee 5
          local.get 5
          i32.const 8
          i32.add
          i32.load
          i32.const 13
          i32.mul
          i32.const 15
          i32.add
          i32.const -4
          i32.and
          call 24
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        i32.const 31
        i32.and
        local.get 3
        local.get 0
        i32.load offset=4
        i32.load
        call_indirect (type 0)
        local.tee 17
        i32.eqz
        br_if 0 (;@2;)
        local.get 17
        call 20
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=200
            local.tee 21
            br_if 0 (;@4;)
            local.get 6
            i32.wrap_i64
            local.set 5
            i32.const 0
            local.set 20
            i32.const -1
            local.set 22
            br 1 (;@3;)
          end
          local.get 21
          i32.const -4
          i32.add
          i32.load
          local.tee 20
          i32.const -1
          i32.add
          local.tee 22
          local.get 6
          i32.wrap_i64
          i32.and
          local.set 5
        end
        local.get 21
        i32.const -8
        i32.add
        local.set 2
        local.get 21
        i32.const -4
        i32.add
        local.set 19
        local.get 6
        i64.const 57
        i64.shr_u
        i32.wrap_i64
        local.set 9
        local.get 20
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              local.get 21
              local.get 5
              i32.add
              local.tee 23
              i32.load8_s
              local.tee 8
              i32.eqz
              br_if 1 (;@4;)
              local.get 7
              i32.eqz
              br_if 1 (;@4;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.const -1
                  i32.gt_s
                  br_if 0 (;@7;)
                  local.get 9
                  local.get 8
                  i32.const 127
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  i32.load
                  local.get 5
                  i32.const 2
                  i32.shl
                  i32.add
                  local.tee 8
                  i32.load
                  local.get 17
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 4
                  i32.const 1
                  i32.store8 offset=8
                  local.get 21
                  i32.const -12
                  i32.add
                  i32.load
                  local.get 5
                  i32.const 3
                  i32.shl
                  i32.add
                  local.set 5
                  local.get 4
                  i32.const 8
                  i32.add
                  local.set 7
                  br 4 (;@3;)
                end
                local.get 20
                local.get 19
                i32.load
                i32.ne
                br_if 0 (;@6;)
                local.get 5
                local.get 20
                local.get 8
                i32.const 1
                i32.eq
                select
                local.set 20
              end
              local.get 7
              i32.const -1
              i32.add
              local.set 7
              local.get 5
              i32.const 1
              i32.add
              local.get 22
              i32.and
              local.set 5
              br 0 (;@5;)
            end
          end
          local.get 19
          i32.load
          local.set 7
          local.get 0
          local.get 0
          i32.load offset=208
          i32.const -1
          i32.add
          i32.store offset=208
          local.get 21
          local.get 20
          i32.add
          local.get 23
          local.get 20
          local.get 7
          i32.lt_u
          local.tee 7
          select
          local.get 9
          i32.const 128
          i32.or
          i32.store8
          local.get 0
          i32.load offset=200
          i32.const -12
          i32.add
          local.tee 8
          i32.const 4
          i32.add
          i32.load
          local.set 21
          local.get 8
          i32.load
          local.set 8
          local.get 0
          local.get 0
          i32.load offset=204
          i32.const 1
          i32.add
          i32.store offset=204
          local.get 4
          i32.const 0
          i32.store8 offset=8
          local.get 8
          local.get 20
          local.get 5
          local.get 7
          select
          local.tee 7
          i32.const 3
          i32.shl
          i32.add
          local.set 5
          local.get 21
          local.get 7
          i32.const 2
          i32.shl
          i32.add
          local.set 8
          local.get 4
          i32.const 8
          i32.add
          local.set 7
        end
        block  ;; label = @3
          local.get 7
          i32.load8_u
          i32.const 1
          i32.and
          br_if 0 (;@3;)
          local.get 8
          local.get 17
          i32.store
        end
        local.get 5
        local.get 1
        i32.store offset=4
        local.get 5
        local.get 17
        i32.store
        br 1 (;@1;)
      end
      i32.const 0
      local.set 17
    end
    local.get 4
    i32.const 64
    i32.add
    global.set 0
    local.get 17)
  (func (;19;) (type 7) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const -4
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          i64.load align=4
          local.tee 4
          i32.wrap_i64
          local.get 2
          i32.const 2
          i32.const 0
          local.get 4
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          i32.load
          call_indirect (type 0)
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 3
        local.get 2
        i32.store offset=20
        local.get 3
        local.get 1
        i32.store offset=16
        local.get 3
        i32.const 0
        i32.store16 offset=24
        local.get 3
        i32.const 16
        i32.add
        local.set 2
        br 1 (;@1;)
      end
      local.get 3
      i32.const 1
      i32.store16 offset=12
      local.get 3
      i32.const 4
      i32.add
      local.set 2
    end
    local.get 0
    local.get 2
    i64.load align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func (;20;) (type 10) (param i32) (result i64)
    (local i32 i64 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 16
    i32.add
    local.get 0
    i64.extend_i32_u
    i64.const 4294967297
    i64.mul
    local.tee 2
    i64.const -1800455987208640293
    i64.xor
    i64.const 0
    local.get 2
    i64.const 2302960717771869484
    i64.xor
    i64.const 0
    call 41
    local.get 1
    local.get 1
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.const -1800455987208640293
    i64.xor
    i64.const 0
    local.get 1
    i64.load offset=16
    i64.const -6884282663029611477
    i64.xor
    i64.const 0
    call 41
    local.get 1
    i32.const 8
    i32.add
    i64.load
    local.set 2
    local.get 1
    i64.load
    local.set 3
    local.get 1
    i32.const 32
    i32.add
    global.set 0
    local.get 2
    local.get 3
    i64.xor)
  (func (;21;) (type 7) (param i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 1
    local.get 2
    local.get 3
    i32.const 8
    i32.add
    call 31
    local.set 4
    local.get 0
    i32.const 0
    i32.store8 offset=16
    local.get 0
    local.get 4
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.store8 offset=12
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;22;) (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=8
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                i32.load offset=4
                local.set 4
                local.get 1
                i32.eqz
                br_if 2 (;@4;)
                local.get 1
                local.get 3
                i32.load
                i32.store
                local.get 1
                local.get 3
                i32.load offset=4
                i32.store offset=4
                local.get 1
                local.get 3
                i32.load offset=8
                i32.store offset=8
                local.get 1
                local.get 3
                i64.load offset=12 align=4
                i64.store offset=12 align=4
                local.get 3
                i32.load offset=8
                local.tee 5
                br_if 1 (;@5;)
                br 4 (;@2;)
              end
              local.get 1
              br_if 2 (;@3;)
              br 4 (;@1;)
            end
            local.get 5
            local.get 5
            i32.const 16
            i32.add
            i32.load
            local.get 3
            i32.eq
            i32.const 2
            i32.shl
            i32.add
            i32.const 12
            i32.add
            local.set 4
            br 2 (;@2;)
          end
          loop  ;; label = @4
            local.get 3
            i32.load offset=16
            local.set 1
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=12
                local.tee 5
                br_if 0 (;@6;)
                i32.const 0
                local.set 5
                local.get 1
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 1
                  i32.const 16
                  i32.add
                  i32.load
                  local.get 3
                  i32.eq
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.const 12
                  i32.add
                  local.set 4
                end
                i32.const 0
                local.set 1
                local.get 4
                i32.const 0
                i32.store
                local.get 3
                i32.const 12
                i32.add
                i64.const 0
                i64.store align=4
                local.get 3
                i64.const 0
                i64.store offset=4 align=4
                local.get 0
                i32.const 0
                i64.load offset=1049224
                i64.store offset=12 align=4
                br 5 (;@1;)
              end
              block  ;; label = @6
                local.get 1
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                br 1 (;@5;)
              end
              local.get 5
              i32.load offset=4
              local.get 1
              i32.load offset=4
              i32.lt_u
              local.set 5
            end
            local.get 4
            local.get 3
            local.get 5
            call 32
            br 0 (;@4;)
          end
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const 16
            i32.add
            i32.load8_u
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=4
            local.tee 5
            local.get 0
            i32.load
            local.tee 3
            local.get 2
            i32.const 4
            i32.add
            call 31
            drop
            local.get 2
            i32.load offset=4
            local.set 4
            br 1 (;@3;)
          end
          local.get 2
          local.get 0
          i32.load offset=12
          local.tee 4
          i32.store offset=4
          local.get 0
          i32.load
          local.set 3
          local.get 0
          i32.load offset=4
          local.set 5
        end
        local.get 1
        local.get 3
        i32.store
        local.get 5
        local.get 5
        i32.load offset=4
        local.tee 6
        local.get 1
        local.get 6
        select
        local.tee 6
        i32.const 13
        i32.shr_u
        local.get 6
        i32.xor
        local.tee 6
        i32.const 17
        i32.shl
        local.get 6
        i32.xor
        local.tee 6
        i32.const 5
        i32.shr_u
        local.get 6
        i32.xor
        local.tee 6
        i32.store offset=4
        local.get 1
        i64.const 0
        i64.store offset=12 align=4
        local.get 1
        local.get 4
        i32.store offset=8
        local.get 1
        local.get 6
        i32.store offset=4
        local.get 5
        local.set 6
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 3
          i32.load
          local.get 4
          i32.load
          i32.load
          i32.gt_u
          i32.const 2
          i32.shl
          i32.add
          i32.const 12
          i32.add
          local.set 6
        end
        local.get 6
        local.get 1
        i32.store
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.load offset=8
            local.tee 3
            i32.eqz
            br_if 1 (;@3;)
            local.get 3
            i32.load offset=4
            local.get 1
            i32.load offset=4
            i32.le_u
            br_if 1 (;@3;)
            local.get 5
            local.get 3
            local.get 3
            i32.const 16
            i32.add
            i32.load
            local.get 1
            i32.ne
            call 32
            br 0 (;@4;)
          end
        end
        local.get 0
        i32.const 0
        i32.store8 offset=16
        local.get 0
        local.get 4
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 4
      local.get 1
      i32.store
      local.get 2
      local.get 3
      i64.load offset=12 align=4
      i64.store offset=8
      i32.const 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        i32.const 8
        i32.eq
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 2
          i32.const 8
          i32.add
          local.get 3
          i32.add
          i32.load
          local.tee 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          local.get 1
          i32.store offset=8
        end
        local.get 3
        i32.const 4
        i32.add
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;23;) (type 7) (param i32 i32 i32)
    local.get 0
    local.get 1
    i32.const 16
    i32.const 65536
    local.get 2
    i32.div_u
    i32.const 3
    i32.shr_u
    i32.const 15
    i32.add
    i32.const 32764
    i32.and
    local.get 2
    i32.const 8192
    i32.gt_u
    select
    call 24)
  (func (;24;) (type 7) (param i32 i32 i32)
    (local i32 i64)
    block  ;; label = @1
      local.get 2
      i32.const 0
      local.get 2
      select
      local.tee 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.load align=4
      local.tee 4
      i32.wrap_i64
      local.get 1
      i32.const -1431655766
      local.get 2
      select
      local.get 3
      i32.const 2
      i32.const 0
      local.get 4
      i64.const 32
      i64.shr_u
      i32.wrap_i64
      i32.load offset=8
      call_indirect (type 1)
    end)
  (func (;25;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 3
    i32.const 31
    i32.and
    local.set 6
    block  ;; label = @1
      local.get 2
      i32.const 1
      local.get 3
      i32.shl
      local.tee 7
      local.get 2
      local.get 7
      i32.gt_u
      select
      local.tee 3
      i32.const 32768
      i32.gt_u
      br_if 0 (;@1;)
      i64.const 1
      i32.const 32
      local.get 3
      i32.const -1
      i32.add
      i32.clz
      i32.sub
      i64.extend_i32_u
      i64.const 65535
      i64.and
      i64.shl
      i32.wrap_i64
      local.tee 8
      i32.ctz
      local.tee 9
      i32.const -16
      i32.add
      local.set 3
      local.get 9
      i32.const 3
      i32.shl
      local.get 0
      i32.add
      i32.const 8
      i32.add
      local.set 10
      local.get 9
      i32.const 2
      i32.shl
      local.get 0
      i32.add
      i32.const 136
      i32.add
      local.set 9
      loop  ;; label = @2
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 10
          local.get 1
          local.get 9
          i32.load
          call 26
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i64.const 1
          i32.const 32
          local.get 4
          local.get 7
          local.get 4
          local.get 7
          i32.gt_u
          select
          i32.const -1
          i32.add
          i32.clz
          i32.sub
          i64.extend_i32_u
          i64.const 65535
          i64.and
          i64.shl
          i32.wrap_i64
          i32.ge_u
          return
        end
        local.get 10
        i32.const 8
        i32.add
        local.set 10
        local.get 9
        i32.const 4
        i32.add
        local.set 9
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 8
        i32.const 1
        i32.shl
        local.set 8
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 6
    local.get 4
    local.get 5
    call 27)
  (func (;26;) (type 9) (param i32 i32 i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 1
    i32.const -65536
    i32.and
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.get 1
        i32.eq
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 1
      i32.store
      local.get 3
      i32.const 12
      i32.add
      local.get 0
      local.get 3
      call 21
      block  ;; label = @2
        local.get 3
        i32.load offset=20
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 2
      i32.load
      local.set 2
    end
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 2)
  (func (;27;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 6
    global.set 0
    local.get 6
    i32.const 4
    i32.add
    local.get 0
    i32.const 200
    i32.add
    local.get 1
    call 30
    local.get 6
    i32.load offset=8
    local.set 7
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 1
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      local.get 0
      i32.load offset=4
      i32.load offset=4
      call_indirect (type 2)
      local.tee 0
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 7
      local.get 4
      i32.store offset=4
      local.get 7
      local.get 1
      i32.store
    end
    local.get 6
    i32.const 16
    i32.add
    global.set 0
    local.get 0)
  (func (;28;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 5
    global.set 0
    local.get 3
    i32.const 31
    i32.and
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        local.get 3
        i32.shl
        local.tee 3
        local.get 2
        local.get 3
        i32.gt_u
        select
        local.tee 3
        i32.const 32768
        i32.gt_u
        br_if 0 (;@2;)
        i64.const 1
        i32.const 32
        local.get 3
        i32.const -1
        i32.add
        i32.clz
        i32.sub
        i64.extend_i32_u
        i64.const 65535
        i64.and
        i64.shl
        i32.wrap_i64
        local.tee 7
        i32.ctz
        local.tee 8
        i32.const -16
        i32.add
        local.set 3
        local.get 8
        i32.const 3
        i32.shl
        local.get 0
        i32.add
        i32.const 8
        i32.add
        local.set 9
        local.get 8
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.const 136
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 3
          i32.eqz
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 9
              local.get 1
              local.get 8
              i32.load
              call 26
              local.tee 10
              i32.eqz
              br_if 0 (;@5;)
              local.get 10
              local.get 1
              local.get 10
              i32.load
              i32.sub
              local.get 7
              i32.div_u
              local.tee 3
              i32.const 3
              i32.shr_u
              i32.const 16383
              i32.and
              i32.add
              local.tee 1
              local.get 1
              i32.load8_u offset=12
              i32.const -2
              local.get 3
              i32.const 7
              i32.and
              i32.rotl
              i32.and
              i32.store8 offset=12
              local.get 10
              local.get 10
              i32.load16_u offset=8
              local.get 10
              i32.const 10
              i32.add
              local.tee 3
              i32.load8_u
              i32.const 16
              i32.shl
              i32.or
              i32.const -1
              i32.add
              local.tee 1
              i32.store16 offset=8
              local.get 3
              local.get 1
              i32.const 131071
              i32.and
              local.tee 1
              i32.const 16
              i32.shr_u
              i32.store8
              local.get 1
              i32.eqz
              br_if 1 (;@4;)
              br 4 (;@1;)
            end
            local.get 9
            i32.const 8
            i32.add
            local.set 9
            local.get 8
            i32.const 4
            i32.add
            local.set 8
            local.get 3
            i32.const 1
            i32.add
            local.set 3
            local.get 7
            i32.const 1
            i32.shl
            local.set 7
            br 1 (;@3;)
          end
        end
        local.get 5
        i32.const 12
        i32.add
        local.get 9
        local.get 10
        call 21
        local.get 5
        i32.load offset=20
        local.set 3
        local.get 5
        i32.const 12
        i32.add
        i32.const 0
        call 22
        block  ;; label = @3
          local.get 8
          i32.load
          local.get 10
          i32.ne
          br_if 0 (;@3;)
          local.get 8
          i32.const 0
          i32.store
        end
        local.get 0
        i64.load align=4
        local.tee 11
        i32.wrap_i64
        local.get 10
        i32.load
        i32.const 65536
        i32.const 16
        i32.const 0
        local.get 11
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.load offset=8
        call_indirect (type 1)
        local.get 0
        local.get 10
        local.get 7
        call 23
        local.get 3
        local.get 0
        i32.const 228
        i32.add
        local.tee 8
        i32.load
        i32.store
        local.get 8
        local.get 3
        i32.store
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      local.get 2
      local.get 6
      local.get 4
      call 29
    end
    local.get 5
    i32.const 32
    i32.add
    global.set 0)
  (func (;29;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i64 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    i32.const 12
    i32.add
    local.get 0
    i32.const 200
    i32.add
    local.get 1
    call 30
    local.get 0
    i32.load
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 0
    i32.load offset=4
    i32.load offset=8
    call_indirect (type 1)
    local.get 0
    i32.load offset=200
    local.set 6
    i32.const 1049268
    local.set 7
    block  ;; label = @1
      local.get 0
      i32.const 204
      i32.add
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call 20
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          local.get 6
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          i32.const -1
          local.set 9
          br 1 (;@2;)
        end
        local.get 6
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const -1
        i32.add
        local.set 9
      end
      local.get 6
      i32.const -8
      i32.add
      local.set 10
      local.get 9
      local.get 8
      i32.wrap_i64
      i32.and
      local.set 4
      local.get 8
      i64.const 57
      i64.shr_u
      i32.wrap_i64
      local.set 11
      loop  ;; label = @2
        local.get 6
        local.get 4
        i32.add
        i32.load8_s
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 2
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 11
          local.get 2
          i32.const 127
          i32.and
          i32.ne
          br_if 0 (;@3;)
          local.get 10
          i32.load
          local.get 4
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          i32.const 1
          i32.store8 offset=28
          local.get 5
          local.get 4
          i32.store offset=24
          local.get 5
          i32.const 24
          i32.add
          local.set 7
          br 2 (;@1;)
        end
        local.get 3
        i32.const -1
        i32.add
        local.set 3
        local.get 4
        i32.const 1
        i32.add
        local.get 9
        i32.and
        local.set 4
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 7
      i32.load8_u offset=4
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      local.get 7
      i32.load
      i32.add
      i32.const 1
      i32.store8
      local.get 0
      local.get 0
      i32.load offset=204
      i32.const -1
      i32.add
      i32.store offset=204
      local.get 0
      local.get 0
      i32.load offset=208
      i32.const 1
      i32.add
      i32.store offset=208
    end
    local.get 5
    i32.const 32
    i32.add
    global.set 0)
  (func (;30;) (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 1
    i32.load
    local.set 4
    i32.const 1049268
    local.set 5
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      call 20
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          i32.const 0
          local.set 7
          i32.const -1
          local.set 8
          br 1 (;@2;)
        end
        local.get 4
        i32.const -4
        i32.add
        i32.load
        local.tee 7
        i32.const -1
        i32.add
        local.set 8
      end
      local.get 4
      i32.const -8
      i32.add
      local.set 9
      local.get 8
      local.get 6
      i32.wrap_i64
      i32.and
      local.set 1
      local.get 6
      i64.const 57
      i64.shr_u
      i32.wrap_i64
      local.set 10
      loop  ;; label = @2
        local.get 4
        local.get 1
        i32.add
        i32.load8_s
        local.tee 11
        i32.eqz
        br_if 1 (;@1;)
        local.get 7
        i32.eqz
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 11
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 10
          local.get 11
          i32.const 127
          i32.and
          i32.ne
          br_if 0 (;@3;)
          local.get 9
          i32.load
          local.get 1
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.const 1
          i32.store8 offset=12
          local.get 3
          local.get 1
          i32.store offset=8
          local.get 3
          i32.const 8
          i32.add
          local.set 5
          br 2 (;@1;)
        end
        local.get 7
        i32.const -1
        i32.add
        local.set 7
        local.get 1
        i32.const 1
        i32.add
        local.get 8
        i32.and
        local.set 1
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.load8_u offset=4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const -12
        i32.add
        local.tee 7
        i32.load
        local.get 5
        i32.load
        local.tee 11
        i32.const 3
        i32.shl
        i32.add
        local.set 1
        local.get 7
        i32.const 4
        i32.add
        i32.load
        local.get 11
        i32.const 2
        i32.shl
        i32.add
        local.set 7
        i32.const 1
        local.set 11
        br 1 (;@1;)
      end
      i32.const 0
      local.set 11
      local.get 3
      i32.const 6
      i32.add
      i32.const 0
      i32.store8
      local.get 3
      i32.const 0
      i32.store16 offset=4
      i32.const 0
      local.set 1
      i32.const 0
      local.set 7
    end
    local.get 0
    local.get 11
    i32.store8 offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store
    local.get 0
    local.get 3
    i32.load16_u offset=4
    i32.store16 offset=9 align=1
    local.get 0
    i32.const 11
    i32.add
    local.get 3
    i32.const 6
    i32.add
    i32.load8_u
    i32.store8
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;31;) (type 9) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load
    local.set 0
    local.get 2
    i32.const 0
    i32.store
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 3
        local.get 0
        i32.load
        i32.load
        local.tee 4
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.store
        local.get 0
        local.get 3
        local.get 4
        i32.ge_u
        i32.const 2
        i32.shl
        i32.add
        i32.const 12
        i32.add
        i32.load
        local.set 0
        br 0 (;@2;)
      end
    end
    local.get 0)
  (func (;32;) (type 7) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    local.get 1
    local.get 2
    i32.const -1
    i32.xor
    i32.const 1
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.const 12
    i32.add
    local.tee 3
    i32.load
    local.tee 4
    local.get 2
    i32.const 1
    i32.and
    i32.const 2
    i32.shl
    i32.add
    i32.const 12
    i32.add
    local.tee 5
    i32.load
    local.set 6
    local.get 1
    i32.load offset=8
    local.set 2
    local.get 5
    local.get 1
    i32.store
    local.get 1
    local.get 4
    i32.store offset=8
    local.get 3
    local.get 6
    i32.store
    local.get 4
    local.get 2
    i32.store offset=8
    block  ;; label = @1
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      local.get 1
      i32.store offset=8
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 2
      i32.const 16
      i32.add
      i32.load
      local.get 1
      i32.eq
      i32.const 2
      i32.shl
      i32.add
      i32.const 12
      i32.add
      local.set 0
    end
    local.get 0
    local.get 4
    i32.store)
  (func (;33;) (type 9) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    i32.const 0
    local.set 4
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 2
          local.get 4
          i32.ne
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          br 2 (;@1;)
        end
        local.get 3
        i32.const 8
        i32.add
        local.get 0
        i32.load
        local.get 1
        local.get 4
        i32.add
        local.get 2
        local.get 4
        i32.sub
        local.get 0
        i32.load offset=4
        call_indirect (type 3)
        local.get 4
        local.get 3
        i64.load offset=8
        local.tee 6
        i32.wrap_i64
        i32.add
        local.set 4
        local.get 6
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        local.tee 5
        i32.const 65535
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 3
    i32.const 16
    i32.add
    global.set 0
    local.get 5)
  (func (;34;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 4
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 12
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=8
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 7
        loop  ;; label = @3
          local.get 7
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 6
              local.tee 9
              local.get 1
              i32.ge_u
              br_if 0 (;@5;)
              local.get 0
              local.get 9
              i32.add
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 6
                  i32.const 4
                  i32.add
                  local.get 1
                  i32.gt_u
                  br_if 1 (;@6;)
                  local.get 10
                  local.get 11
                  i32.add
                  i32.load align=1
                  i32.const -2139062144
                  i32.and
                  br_if 1 (;@6;)
                  local.get 11
                  i32.const 4
                  i32.add
                  local.set 11
                  br 0 (;@7;)
                end
              end
              local.get 8
              local.get 11
              i32.add
              local.set 7
              local.get 6
              local.get 1
              i32.ge_u
              br_if 2 (;@3;)
              i32.const 1049240
              local.set 6
              block  ;; label = @6
                local.get 10
                local.get 11
                i32.add
                local.tee 12
                i32.load8_s
                local.tee 7
                i32.const -1
                i32.gt_s
                br_if 0 (;@6;)
                i32.const 1049244
                local.set 6
                local.get 7
                i32.const -32
                i32.and
                i32.const -64
                i32.eq
                br_if 0 (;@6;)
                i32.const 1049248
                local.set 6
                local.get 7
                i32.const -16
                i32.and
                i32.const -32
                i32.eq
                br_if 0 (;@6;)
                i32.const 1049252
                i32.const 1049232
                local.get 7
                i32.const -8
                i32.and
                i32.const -16
                i32.eq
                select
                local.set 6
              end
              block  ;; label = @6
                local.get 6
                i32.load16_u
                br_if 0 (;@6;)
                local.get 9
                local.get 6
                i32.load8_u offset=2
                i32.const 7
                i32.and
                local.tee 10
                i32.add
                local.get 11
                i32.add
                local.tee 6
                local.get 1
                i32.gt_u
                br_if 0 (;@6;)
                local.get 10
                i32.const 1
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 10
                        i32.const -2
                        i32.add
                        br_table 0 (;@10;) 1 (;@9;) 2 (;@8;) 0 (;@10;)
                      end
                      block  ;; label = @10
                        local.get 12
                        i32.const 1
                        i32.add
                        i32.load8_u
                        local.tee 9
                        i32.const 192
                        i32.and
                        i32.const 128
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 4
                        i64.const 21474836480
                        i64.store offset=88
                        local.get 4
                        i32.const 88
                        i32.add
                        local.set 9
                        br 3 (;@7;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.const 31
                        i32.and
                        i32.const 6
                        i32.shl
                        local.get 9
                        i32.const 63
                        i32.and
                        i32.or
                        local.tee 9
                        i32.const 127
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 4
                        i64.const 25769803776
                        i64.store offset=88
                        local.get 4
                        i32.const 88
                        i32.add
                        local.set 9
                        br 3 (;@7;)
                      end
                      local.get 4
                      i32.const 0
                      i32.store8 offset=90
                      local.get 4
                      local.get 9
                      i32.store16 offset=88
                      local.get 4
                      i32.const 0
                      i32.store16 offset=92
                      local.get 4
                      i32.const 88
                      i32.add
                      local.set 9
                      br 2 (;@7;)
                    end
                    i32.const 5
                    local.set 9
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 12
                        i32.const 1
                        i32.add
                        i32.load8_u
                        local.tee 10
                        i32.const 192
                        i32.and
                        i32.const 128
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 12
                        i32.const 2
                        i32.add
                        i32.load8_u
                        local.tee 12
                        i32.const 192
                        i32.and
                        i32.const 128
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 6
                        local.set 9
                        local.get 10
                        i32.const 63
                        i32.and
                        i32.const 6
                        i32.shl
                        local.get 7
                        i32.const 15
                        i32.and
                        i32.const 12
                        i32.shl
                        i32.or
                        local.tee 10
                        local.get 12
                        i32.const 63
                        i32.and
                        i32.or
                        local.tee 7
                        i32.const 2047
                        i32.gt_u
                        br_if 1 (;@9;)
                      end
                      local.get 4
                      local.get 9
                      i32.store16 offset=92
                      local.get 4
                      i32.const 88
                      i32.add
                      local.set 9
                      br 2 (;@7;)
                    end
                    block  ;; label = @9
                      local.get 10
                      i32.const 63488
                      i32.and
                      i32.const 55296
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 4
                      i64.const 30064771072
                      i64.store offset=88
                      local.get 4
                      i32.const 88
                      i32.add
                      local.set 9
                      br 2 (;@7;)
                    end
                    local.get 4
                    i32.const 0
                    i32.store8 offset=90
                    local.get 4
                    local.get 7
                    i32.store16 offset=88
                    local.get 4
                    i32.const 0
                    i32.store16 offset=92
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 12
                    i32.const 1
                    i32.add
                    i32.load8_u
                    local.tee 9
                    i32.const 192
                    i32.and
                    i32.const 128
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 4
                    i64.const 21474836480
                    i64.store offset=88
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 12
                    i32.const 2
                    i32.add
                    i32.load8_u
                    local.tee 10
                    i32.const 192
                    i32.and
                    i32.const 128
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 4
                    i64.const 21474836480
                    i64.store offset=88
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 12
                    i32.const 3
                    i32.add
                    i32.load8_u
                    local.tee 12
                    i32.const 192
                    i32.and
                    i32.const 128
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 4
                    i64.const 21474836480
                    i64.store offset=88
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 9
                    i32.const 63
                    i32.and
                    i32.const 6
                    i32.shl
                    local.get 7
                    i32.const 12
                    i32.shl
                    i32.or
                    local.get 10
                    i32.const 63
                    i32.and
                    i32.or
                    i32.const 6
                    i32.shl
                    local.get 12
                    i32.const 63
                    i32.and
                    i32.or
                    local.tee 9
                    i32.const 2097151
                    i32.and
                    local.tee 10
                    i32.const 65535
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 4
                    i64.const 25769803776
                    i64.store offset=88
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 10
                    i32.const 1114112
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 4
                    i64.const 34359738368
                    i64.store offset=88
                    local.get 4
                    i32.const 88
                    i32.add
                    local.set 9
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 0
                  i32.store16 offset=92
                  local.get 4
                  local.get 9
                  i32.store16 offset=88
                  local.get 4
                  local.get 9
                  i32.const 2031616
                  i32.and
                  i32.const 16
                  i32.shr_u
                  i32.store8 offset=90
                  local.get 4
                  i32.const 88
                  i32.add
                  local.set 9
                end
                local.get 9
                i64.load16_u offset=4
                i64.const 32
                i64.shl
                i64.eqz
                br_if 2 (;@4;)
              end
              local.get 1
              local.set 8
            end
            block  ;; label = @5
              local.get 5
              local.get 8
              i32.gt_u
              br_if 0 (;@5;)
              local.get 4
              local.get 3
              i64.load align=4
              i64.store offset=8
              local.get 4
              i32.const 8
              i32.add
              local.get 0
              local.get 1
              call 33
              local.set 11
              br 4 (;@1;)
            end
            local.get 5
            local.get 8
            i32.sub
            local.set 11
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load16_u offset=16
                local.get 2
                i32.const 18
                i32.add
                i32.load8_u
                i32.const 16
                i32.shl
                i32.or
                local.tee 6
                i32.const 127
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1049240
                local.set 9
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 6
                i32.const 2047
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1049244
                local.set 9
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 6
                i32.const 65535
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1049248
                local.set 9
                br 1 (;@5;)
              end
              i32.const 0
              i32.load offset=1049252
              i32.const 12
              local.get 6
              i32.const 1114112
              i32.lt_u
              select
              local.set 9
            end
            local.get 11
            local.get 5
            i32.gt_u
            local.set 10
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 9
                    i32.const 65535
                    i32.and
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 9
                          i32.const 16
                          i32.shr_u
                          local.tee 9
                          i32.const 7
                          i32.and
                          i32.const -1
                          i32.add
                          br_table 4 (;@7;) 0 (;@11;) 1 (;@10;) 2 (;@9;) 4 (;@7;)
                        end
                        local.get 4
                        local.get 6
                        i32.const 63
                        i32.and
                        i32.const 128
                        i32.or
                        i32.store8 offset=21
                        local.get 4
                        local.get 6
                        i32.const 6
                        i32.shr_u
                        i32.const 192
                        i32.or
                        i32.store8 offset=20
                        br 4 (;@6;)
                      end
                      local.get 6
                      i32.const 2095104
                      i32.and
                      i32.const 55296
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 4
                      local.get 6
                      i32.const 63
                      i32.and
                      i32.const 128
                      i32.or
                      i32.store8 offset=22
                      local.get 4
                      local.get 6
                      i32.const 12
                      i32.shr_u
                      i32.const 224
                      i32.or
                      i32.store8 offset=20
                      local.get 4
                      local.get 6
                      i32.const 6
                      i32.shr_u
                      i32.const 63
                      i32.and
                      i32.const 128
                      i32.or
                      i32.store8 offset=21
                      br 3 (;@6;)
                    end
                    local.get 4
                    local.get 6
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.store8 offset=23
                    local.get 4
                    local.get 6
                    i32.const 18
                    i32.shr_u
                    i32.const 240
                    i32.or
                    i32.store8 offset=20
                    local.get 4
                    local.get 6
                    i32.const 6
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.store8 offset=22
                    local.get 4
                    local.get 6
                    i32.const 12
                    i32.shr_u
                    i32.const 63
                    i32.and
                    i32.const 128
                    i32.or
                    i32.store8 offset=21
                    br 2 (;@6;)
                  end
                  i32.const 3
                  local.set 6
                  i32.const 1049236
                  local.set 9
                  br 2 (;@5;)
                end
                local.get 4
                local.get 6
                i32.store8 offset=20
              end
              local.get 9
              i32.const 7
              i32.and
              local.set 6
              local.get 4
              i32.const 20
              i32.add
              local.set 9
            end
            i32.const 0
            local.get 11
            local.get 10
            select
            local.set 10
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.load8_u offset=20
                  i32.const 3
                  i32.and
                  br_table 0 (;@7;) 1 (;@6;) 2 (;@5;) 0 (;@7;)
                end
                local.get 4
                local.get 3
                i64.load align=4
                i64.store offset=24
                local.get 4
                i32.const 24
                i32.add
                local.get 0
                local.get 1
                call 33
                local.tee 11
                i32.const 65535
                i32.and
                br_if 5 (;@1;)
                local.get 4
                local.get 3
                i64.load align=4
                i64.store offset=32
                local.get 4
                i32.const 32
                i32.add
                local.get 9
                local.get 6
                local.get 10
                call 36
                local.set 11
                br 5 (;@1;)
              end
              local.get 4
              local.get 3
              i64.load align=4
              i64.store offset=40
              local.get 4
              i32.const 40
              i32.add
              local.get 9
              local.get 6
              local.get 10
              i32.const 1
              i32.shr_u
              call 36
              local.tee 11
              i32.const 65535
              i32.and
              br_if 4 (;@1;)
              local.get 4
              local.get 3
              i64.load align=4
              i64.store offset=48
              local.get 4
              i32.const 48
              i32.add
              local.get 0
              local.get 1
              call 33
              local.tee 11
              i32.const 65535
              i32.and
              br_if 4 (;@1;)
              local.get 4
              local.get 3
              i64.load align=4
              i64.store offset=56
              local.get 4
              i32.const 56
              i32.add
              local.get 9
              local.get 6
              local.get 10
              i32.const 1
              i32.add
              i32.const 1
              i32.shr_u
              call 36
              local.set 11
              br 4 (;@1;)
            end
            local.get 4
            local.get 3
            i64.load align=4
            i64.store offset=64
            local.get 4
            i32.const 64
            i32.add
            local.get 9
            local.get 6
            local.get 10
            call 36
            local.tee 11
            i32.const 65535
            i32.and
            br_if 3 (;@1;)
            local.get 4
            local.get 3
            i64.load align=4
            i64.store offset=72
            local.get 4
            i32.const 72
            i32.add
            local.get 0
            local.get 1
            call 33
            local.set 11
            br 3 (;@1;)
          end
          local.get 8
          local.get 11
          i32.add
          i32.const 1
          i32.add
          local.set 7
          br 0 (;@3;)
        end
      end
      local.get 4
      local.get 3
      i64.load align=4
      i64.store offset=80
      local.get 4
      i32.const 80
      i32.add
      local.get 0
      local.get 1
      call 33
      local.set 11
    end
    local.get 4
    i32.const 96
    i32.add
    global.set 0
    local.get 11)
  (func (;35;) (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 65535
        i32.and
        local.tee 4
        i32.const 100
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        i32.const 15
        i32.add
        local.get 3
        i32.add
        i32.const 15
        i32.add
        local.get 0
        local.get 4
        i32.const 100
        i32.div_u
        local.tee 4
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1048942
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 3
        i32.const -2
        i32.add
        local.set 3
        local.get 4
        local.set 0
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 65535
        i32.and
        local.tee 4
        i32.const 9
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 15
        i32.add
        local.get 3
        i32.add
        i32.const 16
        i32.add
        local.get 0
        i32.const 48
        i32.or
        i32.store8
        local.get 3
        i32.const 16
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      local.get 2
      i32.const 15
      i32.add
      local.get 3
      i32.add
      i32.const 15
      i32.add
      local.get 4
      i32.const 1
      i32.shl
      i32.const 1048942
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
      local.get 3
      i32.const 15
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 15
    i32.add
    local.get 0
    i32.add
    i32.const 17
    local.get 0
    i32.sub
    i32.const 1049200
    local.get 1
    call 34
    local.set 0
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 0)
  (func (;36;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 3
    i32.const 1
    i32.add
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          br 2 (;@1;)
        end
        local.get 4
        local.get 0
        i64.load align=4
        i64.store offset=8
        local.get 4
        i32.const 8
        i32.add
        local.get 1
        local.get 2
        call 33
        local.tee 5
        i32.const 65535
        i32.and
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 4
    i32.const 16
    i32.add
    global.set 0
    local.get 5)
  (func (;37;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 1
    local.get 2
    i32.shl
    local.tee 4
    local.get 1
    i32.add
    local.set 5
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 5
      call 38
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 0
    local.get 4
    i32.sub
    local.set 6
    local.get 4
    i32.const -1
    i32.add
    local.set 7
    loop  ;; label = @1
      local.get 2
      i32.const 8
      i32.add
      local.set 8
      loop  ;; label = @2
        block  ;; label = @3
          local.get 7
          local.get 0
          i32.load offset=12
          local.tee 4
          local.get 8
          i32.add
          local.tee 9
          i32.add
          local.get 6
          i32.and
          local.get 9
          i32.sub
          local.get 4
          i32.add
          local.tee 10
          local.get 1
          i32.add
          local.tee 4
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -8
          i32.add
          local.tee 11
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          i32.store offset=12
          local.get 8
          local.get 10
          i32.add
          return
        end
        block  ;; label = @3
          local.get 0
          i32.load
          local.get 2
          local.get 9
          i32.const 2
          local.get 4
          i32.const 8
          i32.add
          local.tee 4
          i32.const 0
          local.get 0
          i32.load offset=4
          i32.load offset=4
          call_indirect (type 2)
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i32.store offset=4
          br 1 (;@2;)
        end
      end
      local.get 0
      local.get 11
      local.get 5
      call 38
      local.tee 2
      br_if 0 (;@1;)
    end
    i32.const 0)
  (func (;38;) (type 9) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 1
      local.get 2
      i32.add
      i32.const 24
      i32.add
      local.tee 2
      i32.const 1
      i32.shr_u
      local.get 2
      i32.add
      local.tee 1
      i32.const 2
      i32.const 0
      local.get 0
      i32.load offset=4
      i32.load
      call_indirect (type 0)
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.store
      local.get 2
      local.get 1
      i32.store offset=4
      local.get 2
      local.get 0
      i32.load offset=8
      i32.store
      local.get 0
      i32.const 12
      i32.add
      i32.const 0
      i32.store
      local.get 0
      local.get 2
      i32.store offset=8
    end
    local.get 2)
  (func (;39;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 7
        local.get 0
        i32.const 12
        i32.add
        i32.load
        local.tee 8
        i32.add
        i32.const 8
        i32.add
        local.get 1
        local.get 2
        i32.add
        i32.eq
        br_if 0 (;@2;)
        local.get 4
        local.get 2
        i32.le_u
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        local.get 2
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        local.get 2
        i32.sub
        local.get 8
        i32.add
        i32.store offset=12
        i32.const 1
        return
      end
      local.get 7
      i32.load offset=4
      i32.const -8
      i32.add
      local.get 8
      i32.sub
      local.get 4
      local.get 2
      i32.sub
      local.tee 2
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 8
      local.get 2
      i32.add
      i32.store offset=12
      i32.const 1
      return
    end
    local.get 6)
  (func (;40;) (type 1) (param i32 i32 i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      local.get 0
      i32.const 12
      i32.add
      i32.load
      local.tee 6
      i32.add
      i32.const 8
      i32.add
      local.get 1
      local.get 2
      i32.add
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      local.get 6
      local.get 2
      i32.sub
      i32.store offset=12
    end)
  (func (;41;) (type 11) (param i32 i64 i64 i64 i64)
    (local i64)
    local.get 0
    local.get 4
    local.get 1
    i64.mul
    local.get 2
    local.get 3
    i64.mul
    i64.add
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 2
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 4
    i64.mul
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 3
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 1
    i64.mul
    local.tee 5
    i64.const 32
    i64.shr_u
    local.get 3
    local.get 4
    i64.mul
    i64.add
    local.tee 3
    i64.const 32
    i64.shr_u
    i64.add
    local.get 3
    i64.const 4294967295
    i64.and
    local.get 2
    local.get 1
    i64.mul
    i64.add
    local.tee 1
    i64.const 32
    i64.shr_u
    i64.add
    i64.store offset=8
    local.get 0
    local.get 1
    i64.const 32
    i64.shl
    local.get 5
    i64.const 4294967295
    i64.and
    i64.or
    i64.store)
  (func (;42;) (type 9) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;43;) (type 9) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const -1
      i32.add
      local.set 2
      local.get 0
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0)
  (table (;0;) 12 12 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "setup" (func 1))
  (export "receiveGameParams" (func 7))
  (export "runFib" (func 9))
  (elem (;0;) (i32.const 1) func 2 5 15 16 17 18 25 28 37 39 40)
  (data (;0;) (i32.const 1048576) "\03\00\00\00\04\00\00\00\05\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00ERROR: Can't parse GameParams v{d}; only prepared for v{}\00Invalid result offset\00Invalid offset\00Fib index too high\00bot_zig\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00Reserving space for {d} bytes.\00\00\00\01\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\d8\02\10\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00 \00\00\00\02\00\00\00\00\00\00\00\01\00\00\00\09\00\00\00\ef\bf\bd\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00\09\00\00\00\0a\00\00\00\0b\00\00\00\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1049280) "\aa\aa\aa\aa\00\00\00\00"))
