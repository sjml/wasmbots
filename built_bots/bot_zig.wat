(module
  (type (;0;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32 i32 i32)))
  (type (;2;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func (param i64) (result i64)))
  (type (;7;) (func (param i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (param i32 i32 i32)))
  (type (;10;) (func (param i32) (result i64)))
  (type (;11;) (func (param i32 i64 i64 i64 i64)))
  (import "env" "logFunction" (func (;0;) (type 3)))
  (func (;1;) (type 4) (param i32) (result i32)
    (local i32 i32 i64)
    global.get 0
    i32.const 240
    i32.sub
    local.tee 1
    global.set 0
    i32.const 1048632
    i32.const 22
    call 0
    local.get 1
    i32.const 4
    i32.add
    i32.const 1048668
    i32.const 232
    call 32
    drop
    i32.const 0
    i32.const 1048900
    i32.store offset=1048964
    i32.const 0
    local.get 1
    i32.const 4
    i32.add
    i32.store offset=1048960
    block  ;; label = @1
      i32.const 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          br_if 0 (;@3;)
          i32.const -1
          local.set 2
          br 1 (;@2;)
        end
        i32.const 0
        i64.load offset=1048960
        local.tee 3
        i32.wrap_i64
        local.get 0
        i32.const 0
        i32.const 0
        local.get 3
        i64.const 32
        i64.shr_u
        i32.wrap_i64
        i32.load
        call_indirect (type 0)
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 0
      local.get 0
      i32.store offset=1048972
      i32.const 0
      local.get 2
      i32.store offset=1048968
      local.get 1
      i32.const 240
      i32.add
      global.set 0
      local.get 2
      return
    end
    loop (result i32)  ;; label = @1
      unreachable
      br 0 (;@1;)
    end)
  (func (;2;) (type 5) (param i32 i32) (result i32)
    (local i32 i64)
    block  ;; label = @1
      local.get 1
      i32.const 8
      i32.add
      i32.const 0
      i32.load offset=1048972
      local.tee 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 1048576
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
      i32.const 1048598
      i32.const 14
      call 0
      i32.const 0
      return
    end
    block  ;; label = @1
      i32.const 0
      i32.load offset=1048968
      local.tee 2
      local.get 0
      i32.add
      i64.load8_u
      local.tee 3
      i64.const 94
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 1048613
      i32.const 18
      call 0
      i32.const 0
      return
    end
    local.get 2
    local.get 1
    i32.add
    local.get 3
    call 3
    i64.store align=1
    i32.const 1)
  (func (;3;) (type 6) (param i64) (result i64)
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
      call 3
      local.get 1
      i64.add
      local.set 1
      local.get 0
      i64.const -1
      i64.add
      local.set 0
      br 0 (;@1;)
    end)
  (func (;4;) (type 7) (param i32 i32 i32) (result i32)
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
              call 5
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
  (func (;5;) (type 8) (param i32 i32 i32 i32)
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
  (func (;6;) (type 3) (param i32 i32)
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
      i32.const 1048912
      local.get 0
      local.get 1
      i32.const 2048
      local.get 1
      i32.const 2048
      i32.lt_u
      select
      local.get 0
      i32.sub
      call 7
    end
    block  ;; label = @1
      local.get 1
      i32.const 2048
      i32.le_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1048956
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4096
        i32.store offset=1048956
        i32.const 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        i32.const 16
        i32.shl
        local.tee 3
        i32.store offset=1048952
        local.get 3
        i32.const 0
        i32.const 65536
        call 31
        drop
      end
      local.get 2
      i32.const 0
      i64.load offset=1048952
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
      call 7
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;7;) (type 9) (param i32 i32 i32)
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
    call 5
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;8;) (type 0) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.const -65535
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 1048912
        local.get 1
        i32.const 65535
        i32.add
        i32.const 16
        i32.shr_u
        local.tee 1
        local.get 2
        call 4
        local.tee 4
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 1048952
          local.get 1
          local.get 2
          call 4
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
        call 6
      end
      local.get 4
      i32.const 16
      i32.shl
      local.set 4
    end
    local.get 4)
  (func (;9;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
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
      call 6
    end
    local.get 2)
  (func (;10;) (type 1) (param i32 i32 i32 i32 i32)
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
    call 6)
  (func (;11;) (type 0) (param i32 i32 i32 i32) (result i32)
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
                call 12
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
                call 31
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
                    call 13
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
                  call 12
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
                  call 31
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
                    i32.const 1048928
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
                    call 12
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
                  call 14
                  local.get 4
                  i32.const 8
                  i32.add
                  local.get 8
                  call 15
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
              call 16
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
          call 17
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
        call 13
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
  (func (;12;) (type 9) (param i32 i32 i32)
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
  (func (;13;) (type 10) (param i32) (result i64)
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
    call 30
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
    call 30
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
  (func (;14;) (type 9) (param i32 i32 i32)
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
    call 24
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
  (func (;15;) (type 3) (param i32 i32)
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
                i64.load offset=1048920
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
            call 25
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
            call 24
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
            call 25
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
  (func (;16;) (type 9) (param i32 i32 i32)
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
    call 17)
  (func (;17;) (type 9) (param i32 i32 i32)
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
  (func (;18;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
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
          call 19
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
    call 20)
  (func (;19;) (type 7) (param i32 i32 i32) (result i32)
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
      call 14
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
  (func (;20;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
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
    call 23
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
  (func (;21;) (type 1) (param i32 i32 i32 i32 i32)
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
              call 19
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
        call 14
        local.get 5
        i32.load offset=20
        local.set 3
        local.get 5
        i32.const 12
        i32.add
        i32.const 0
        call 15
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
        call 16
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
      call 22
    end
    local.get 5
    i32.const 32
    i32.add
    global.set 0)
  (func (;22;) (type 1) (param i32 i32 i32 i32 i32)
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
    call 23
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
    i32.const 1048940
    local.set 7
    block  ;; label = @1
      local.get 0
      i32.const 204
      i32.add
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call 13
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
  (func (;23;) (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 3
    global.set 0
    local.get 1
    i32.load
    local.set 4
    i32.const 1048940
    local.set 5
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      call 13
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
  (func (;24;) (type 7) (param i32 i32 i32) (result i32)
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
  (func (;25;) (type 9) (param i32 i32 i32)
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
  (func (;26;) (type 0) (param i32 i32 i32 i32) (result i32)
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
      call 27
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
      call 27
      local.tee 2
      br_if 0 (;@1;)
    end
    i32.const 0)
  (func (;27;) (type 7) (param i32 i32 i32) (result i32)
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
  (func (;28;) (type 2) (param i32 i32 i32 i32 i32 i32) (result i32)
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
  (func (;29;) (type 1) (param i32 i32 i32 i32 i32)
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
  (func (;30;) (type 11) (param i32 i64 i64 i64 i64)
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
  (func (;31;) (type 7) (param i32 i32 i32) (result i32)
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
  (func (;32;) (type 7) (param i32 i32 i32) (result i32)
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
  (table (;0;) 10 10 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "setup" (func 1))
  (export "runFib" (func 2))
  (elem (;0;) (i32.const 1) func 8 9 10 11 18 21 26 28 29)
  (data (;0;) (i32.const 1048576) "Invalid result offset\00Invalid offset\00Fib index too high\00Zig -> wasm reporting!\00\00\01\00\00\00\02\00\00\00\03\00\00\00\00\00\00\00P\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00P\00\10\00\00\00\00\00\00\00\00\00\00\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00\90\01\10\00\10\00\00\00\00\00\00\00\01\00\00\00\07\00\00\00\08\00\00\00\09\00\00\00\00\00\00\00\00\00\00\00")
  (data (;1;) (i32.const 1048952) "\aa\aa\aa\aa\00\00\00\00"))
