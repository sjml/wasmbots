(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func))
  (type (;5;) (func (param i64) (result i64)))
  (type (;6;) (func (param i32) (result i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func (param i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32)))
  (import "env" "logFunction" (func (;0;) (type 2)))
  (func (;1;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049208
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1048894
        i32.const 46
        call 2
        br 1 (;@1;)
      end
      i32.const 0
      i32.const 1
      i32.store offset=1049208
    end
    local.get 2
    i32.const 67
    i32.add
    i64.const 0
    i64.store align=1
    local.get 2
    i32.const 74
    i32.add
    i32.const 0
    i32.store align=1
    local.get 2
    i32.const 46
    i32.add
    i32.const 0
    i32.load16_u offset=1049158
    i32.store16
    local.get 2
    i64.const 0
    i64.store offset=59 align=1
    local.get 2
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 2
    i32.const 52
    i32.add
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 16
    i32.add
    i32.const 16
    i32.add
    local.tee 4
    local.get 2
    i32.const 52
    i32.add
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 16
    i32.add
    i32.const 24
    i32.add
    local.tee 5
    local.get 2
    i32.const 52
    i32.add
    i32.const 24
    i32.add
    i32.load16_u
    i32.store16
    local.get 2
    i32.const 0
    i32.load offset=1048837 align=1
    i32.store offset=52
    local.get 2
    i32.const 0
    i32.load offset=1048840 align=1
    i32.store offset=55 align=1
    local.get 2
    i32.const 0
    i32.load offset=1049154 align=2
    i32.store offset=42 align=2
    local.get 2
    local.get 2
    i64.load offset=52 align=4
    i64.store offset=16
    local.get 2
    i32.const 1
    i32.store8 offset=14
    i32.const 2
    i32.const 1049142
    i32.const 11
    call 0
    local.get 0
    i32.const 24
    i32.add
    local.get 5
    i64.load
    i64.store align=2
    local.get 0
    i32.const 16
    i32.add
    local.get 4
    i64.load
    i64.store align=2
    local.get 0
    i32.const 8
    i32.add
    local.get 3
    i64.load
    i64.store align=2
    local.get 0
    local.get 2
    i64.load offset=16
    i64.store align=2
    local.get 0
    local.get 2
    i32.load8_u offset=14
    i32.store8 offset=32
    local.get 2
    i32.const 80
    i32.add
    global.set 0)
  (func (;2;) (type 3) (param i32 i32)
    i32.const 0
    local.get 0
    local.get 1
    call 0)
  (func (;3;) (type 4)
    i64.const 40
    call 4
    drop)
  (func (;4;) (type 5) (param i64) (result i64)
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
      call 4
      local.get 1
      i64.add
      local.set 1
      local.get 0
      i64.const -1
      i64.add
      local.set 0
      br 0 (;@1;)
    end)
  (func (;5;) (type 6) (param i32) (result i32)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049204
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1048845
        i32.const 48
        call 2
        br 1 (;@1;)
      end
      i32.const 0
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 0
            br_if 0 (;@4;)
            i32.const -1
            local.set 3
            br 2 (;@2;)
          end
          i32.const 0
          i64.load offset=1049176
          local.tee 4
          i32.wrap_i64
          local.get 0
          i32.const 0
          i32.const 0
          local.get 4
          i64.const 32
          i64.shr_u
          i32.wrap_i64
          i32.load
          call_indirect (type 0)
          local.tee 3
          br_if 1 (;@2;)
        end
        i32.const 1048789
        i32.const 47
        call 2
        br 1 (;@1;)
      end
      i32.const 0
      local.get 0
      i32.store offset=1049204
      i32.const 0
      local.get 3
      i32.store offset=1049200
      local.get 3
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 2)
  (func (;6;) (type 7) (param i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=1049208
      i32.eqz
      br_if 0 (;@1;)
      call 3
    end)
  (func (;7;) (type 8) (param i32 i32) (result i32)
    (local i32 i32 i64)
    global.get 0
    i32.const 224
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 8
        local.tee 3
        i32.const 65535
        i32.and
        i32.const 7
        i32.eq
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.store offset=204
        local.get 2
        i64.const 128
        i64.store offset=188 align=4
        local.get 2
        local.get 2
        i32.const 196
        i32.add
        i32.store offset=200
        local.get 2
        local.get 2
        i32.const 184
        i32.add
        i32.store offset=196
        local.get 2
        local.get 2
        i32.const 14
        i32.add
        i32.store offset=184
        local.get 2
        local.get 2
        i64.load offset=200
        local.tee 4
        i64.store offset=208
        block  ;; label = @3
          local.get 2
          i32.const 208
          i32.add
          i32.const 1048576
          i32.const 31
          call 10
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.get 2
          i32.const 200
          i32.add
          call 11
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i64.store offset=216
          local.get 2
          i32.const 216
          i32.add
          i32.const 1048610
          i32.const 21
          call 10
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          i32.const 7
          local.get 2
          i32.const 200
          i32.add
          call 11
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=184
          local.get 2
          i32.load offset=192
          call 2
          i32.const 0
          local.set 0
          br 2 (;@1;)
        end
        loop  ;; label = @3
          unreachable
          br 0 (;@3;)
        end
      end
      local.get 0
      i32.const 2
      i32.add
      call 8
      drop
      local.get 0
      i32.const 4
      i32.add
      call 8
      drop
      local.get 0
      i32.const 6
      i32.add
      call 8
      drop
      local.get 2
      i32.const 142
      i32.add
      local.get 0
      call 1
      i32.const 0
      local.set 0
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 26
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.const 180
          i32.add
          local.get 2
          i32.const 172
          i32.add
          i32.load16_u
          i32.store16
          local.get 2
          local.get 2
          i32.load offset=168 align=2
          i32.store offset=176
          local.get 1
          i32.const 26
          i32.add
          local.set 1
          i32.const 0
          local.set 0
          block  ;; label = @4
            loop  ;; label = @5
              local.get 0
              i32.const 6
              i32.eq
              br_if 1 (;@4;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.const 2
                  i32.add
                  local.tee 3
                  i32.const 0
                  i32.load offset=1049204
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 1048737
                  i32.const 51
                  call 2
                  br 1 (;@6;)
                end
                i32.const 0
                i32.load offset=1049200
                local.get 1
                i32.add
                local.get 2
                i32.const 176
                i32.add
                local.get 0
                i32.add
                i32.load16_u
                i32.store16 align=1
                local.get 3
                local.set 1
              end
              local.get 0
              i32.const 2
              i32.add
              local.set 0
              br 0 (;@5;)
            end
          end
          local.get 2
          i32.load8_u offset=174
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.get 0
            i32.add
            i32.const 1
            i32.add
            i32.const 0
            i32.load offset=1049204
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 1048686
            i32.const 50
            call 2
            br 1 (;@3;)
          end
          i32.const 0
          i32.load offset=1049200
          local.get 1
          i32.add
          local.get 0
          i32.add
          local.get 2
          i32.const 142
          i32.add
          local.get 0
          i32.add
          i32.load8_u
          i32.store8
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 0 (;@2;)
      end
    end
    local.get 2
    i32.const 224
    i32.add
    global.set 0
    local.get 0
    i32.const 1
    i32.and)
  (func (;8;) (type 6) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.add
      i32.const 0
      i32.load offset=1049204
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1048635
      i32.const 50
      call 2
      i32.const 0
      return
    end
    i32.const 0
    i32.load offset=1049200
    local.get 0
    i32.add
    i32.load16_u align=1)
  (func (;9;) (type 1) (param i32 i32 i32 i32)
    (local i64 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i64.const 0
        local.set 4
        br 1 (;@1;)
      end
      i64.const 4294967296
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
      call 20
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
  (func (;10;) (type 9) (param i32 i32 i32) (result i32)
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
        call_indirect (type 1)
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
  (func (;11;) (type 8) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    i32.const 16
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
        i32.const 7
        i32.add
        local.get 3
        i32.add
        i32.const -1
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
        i32.const 1048941
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
        i32.const 7
        i32.add
        local.get 3
        i32.add
        local.get 0
        i32.const 48
        i32.or
        i32.store8
        br 1 (;@1;)
      end
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      local.get 2
      i32.const 7
      i32.add
      i32.add
      local.get 4
      i32.const 1
      i32.shl
      i32.const 1048941
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=24
    local.get 2
    i32.const 24
    i32.add
    local.get 2
    i32.const 7
    i32.add
    local.get 3
    i32.add
    i32.const 17
    local.get 3
    i32.sub
    call 10
    local.set 3
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 3)
  (func (;12;) (type 9) (param i32 i32 i32) (result i32)
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
              call 13
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
  (func (;13;) (type 1) (param i32 i32 i32 i32)
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
  (func (;14;) (type 3) (param i32 i32)
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
      i32.const 1049184
      local.get 0
      local.get 1
      i32.const 2048
      local.get 1
      i32.const 2048
      i32.lt_u
      select
      local.get 0
      i32.sub
      call 15
    end
    block  ;; label = @1
      local.get 1
      i32.const 2048
      i32.le_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049196
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4096
        i32.store offset=1049196
        i32.const 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        i32.const 16
        i32.shl
        local.tee 3
        i32.store offset=1049192
        local.get 3
        i32.const 0
        i32.const 65536
        call 19
        drop
      end
      local.get 2
      i32.const 0
      i64.load offset=1049192
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
      call 15
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;15;) (type 2) (param i32 i32 i32)
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
    call 13
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;16;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.const -65535
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 1049184
        local.get 1
        i32.const 65535
        i32.add
        i32.const 16
        i32.shr_u
        local.tee 1
        local.get 2
        call 12
        local.tee 4
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 1049192
          local.get 1
          local.get 2
          call 12
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
        call 14
      end
      local.get 4
      i32.const 16
      i32.shl
      local.set 4
    end
    local.get 4)
  (func (;17;) (type 10) (param i32 i32 i32 i32 i32 i32) (result i32)
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
      call 14
    end
    local.get 2)
  (func (;18;) (type 11) (param i32 i32 i32 i32 i32)
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
    call 14)
  (func (;19;) (type 9) (param i32 i32 i32) (result i32)
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
  (func (;20;) (type 9) (param i32 i32 i32) (result i32)
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
  (table (;0;) 6 6 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "client_setup" (func 1))
  (export "setup" (func 5))
  (export "tick" (func 6))
  (export "receiveGameParams" (func 7))
  (elem (;0;) (i32.const 1) func 3 9 16 17 18)
  (data (;0;) (i32.const 1048576) "ERROR: Can't parse GameParams v{d}; only prepared for v{d}\00CLIENT ERROR: u16 read will overrun reserve memory\00CLIENT ERROR: Writing u8 outside of reserve memory\00CLIENT ERROR: Writing u16 outside of reserve memory\00CLIENT ERROR: Could not allocate reserve memory\00bot_zig\00CLIENT ERROR: Attempting to reserve memory twice\00CLIENT ERROR: Tick callback already registered\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00Good to go!\00\00\00\01\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00H\02\10\00\80\02\10\00\10\00\00\00")
  (data (;1;) (i32.const 1049192) "\aa\aa\aa\aa\00\00\00\00"))
