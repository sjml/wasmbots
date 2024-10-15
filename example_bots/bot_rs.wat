(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32)))
  (type (;8;) (func (param i64) (result i64)))
  (type (;9;) (func (param i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32)))
  (type (;11;) (func (param i64 i32) (result i32)))
  (import "env" "logFunction" (func (;0;) (type 4)))
  (func (;1;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 0
    i32.load
    i32.load8_u
    i32.const 2
    i32.shl
    local.tee 0
    i32.const 1049012
    i32.add
    i32.load
    local.get 0
    i32.const 1048992
    i32.add
    i32.load
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 0))
  (func (;2;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u offset=37
          i32.eqz
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=4
        local.set 3
        block  ;; label = @3
          local.get 1
          i32.load offset=16
          local.tee 4
          local.get 1
          i32.load offset=8
          local.tee 5
          i32.gt_u
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.load offset=12
          local.tee 6
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 20
          i32.add
          local.tee 7
          local.get 1
          i32.load8_u offset=24
          local.tee 8
          i32.add
          i32.const -1
          i32.add
          i32.load8_u
          local.tee 9
          i32.const 16843009
          i32.mul
          local.set 10
          block  ;; label = @4
            block  ;; label = @5
              local.get 8
              i32.const 4
              i32.gt_u
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 3
                local.get 6
                i32.add
                local.set 11
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    local.get 6
                    i32.sub
                    local.tee 12
                    i32.const 7
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 6
                    i32.eq
                    br_if 4 (;@4;)
                    i32.const 0
                    local.set 13
                    loop  ;; label = @9
                      local.get 11
                      local.get 13
                      i32.add
                      i32.load8_u
                      local.get 9
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 12
                      local.get 13
                      i32.const 1
                      i32.add
                      local.tee 13
                      i32.ne
                      br_if 0 (;@9;)
                      br 5 (;@4;)
                    end
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 11
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 13
                        local.get 11
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 13
                        local.get 11
                        i32.sub
                        local.tee 13
                        local.get 12
                        local.get 13
                        local.get 12
                        i32.lt_u
                        select
                        local.set 14
                        i32.const 0
                        local.set 13
                        loop  ;; label = @11
                          local.get 11
                          local.get 13
                          i32.add
                          i32.load8_u
                          local.get 9
                          i32.eq
                          br_if 4 (;@7;)
                          local.get 14
                          local.get 13
                          i32.const 1
                          i32.add
                          local.tee 13
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 14
                        local.get 12
                        i32.const -8
                        i32.add
                        local.tee 15
                        i32.gt_u
                        br_if 2 (;@8;)
                        br 1 (;@9;)
                      end
                      local.get 12
                      i32.const -8
                      i32.add
                      local.set 15
                      i32.const 0
                      local.set 14
                    end
                    loop  ;; label = @9
                      local.get 11
                      local.get 14
                      i32.add
                      local.tee 13
                      i32.const 4
                      i32.add
                      i32.load
                      local.get 10
                      i32.xor
                      local.tee 16
                      i32.const -16843009
                      i32.add
                      local.get 16
                      i32.const -1
                      i32.xor
                      i32.and
                      local.get 13
                      i32.load
                      local.get 10
                      i32.xor
                      local.tee 13
                      i32.const -16843009
                      i32.add
                      local.get 13
                      i32.const -1
                      i32.xor
                      i32.and
                      i32.or
                      i32.const -2139062144
                      i32.and
                      br_if 1 (;@8;)
                      local.get 14
                      i32.const 8
                      i32.add
                      local.tee 14
                      local.get 15
                      i32.le_u
                      br_if 0 (;@9;)
                    end
                  end
                  local.get 14
                  local.get 12
                  i32.eq
                  br_if 3 (;@4;)
                  local.get 11
                  local.get 14
                  i32.add
                  local.set 11
                  local.get 4
                  local.get 14
                  i32.sub
                  local.get 6
                  i32.sub
                  local.set 16
                  i32.const 0
                  local.set 13
                  block  ;; label = @8
                    loop  ;; label = @9
                      local.get 11
                      local.get 13
                      i32.add
                      i32.load8_u
                      local.get 9
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 16
                      local.get 13
                      i32.const 1
                      i32.add
                      local.tee 13
                      i32.ne
                      br_if 0 (;@9;)
                      br 5 (;@4;)
                    end
                  end
                  local.get 13
                  local.get 14
                  i32.add
                  local.set 13
                end
                local.get 1
                local.get 6
                local.get 13
                i32.add
                i32.const 1
                i32.add
                local.tee 6
                i32.store offset=12
                block  ;; label = @7
                  local.get 6
                  local.get 8
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 6
                  local.get 5
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 3
                  local.get 6
                  local.get 8
                  i32.sub
                  local.tee 13
                  i32.add
                  local.get 7
                  local.get 8
                  call 70
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=28
                  local.set 9
                  local.get 1
                  local.get 6
                  i32.store offset=28
                  local.get 3
                  local.get 9
                  i32.add
                  local.set 2
                  local.get 13
                  local.get 9
                  i32.sub
                  local.set 13
                  br 5 (;@2;)
                end
                local.get 4
                local.get 6
                i32.ge_u
                br_if 0 (;@6;)
                br 3 (;@3;)
              end
            end
            loop  ;; label = @5
              local.get 3
              local.get 6
              i32.add
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 4
                        local.get 6
                        i32.sub
                        local.tee 12
                        i32.const 8
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 11
                        i32.const 3
                        i32.add
                        i32.const -4
                        i32.and
                        local.tee 13
                        local.get 11
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 13
                        local.get 11
                        i32.sub
                        local.tee 13
                        local.get 12
                        local.get 13
                        local.get 12
                        i32.lt_u
                        select
                        local.set 14
                        i32.const 0
                        local.set 13
                        loop  ;; label = @11
                          local.get 11
                          local.get 13
                          i32.add
                          i32.load8_u
                          local.get 9
                          i32.eq
                          br_if 5 (;@6;)
                          local.get 14
                          local.get 13
                          i32.const 1
                          i32.add
                          local.tee 13
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        local.get 14
                        local.get 12
                        i32.const -8
                        i32.add
                        local.tee 15
                        i32.gt_u
                        br_if 3 (;@7;)
                        br 2 (;@8;)
                      end
                      local.get 4
                      local.get 6
                      i32.eq
                      br_if 5 (;@4;)
                      i32.const 0
                      local.set 13
                      loop  ;; label = @10
                        local.get 11
                        local.get 13
                        i32.add
                        i32.load8_u
                        local.get 9
                        i32.eq
                        br_if 4 (;@6;)
                        local.get 12
                        local.get 13
                        i32.const 1
                        i32.add
                        local.tee 13
                        i32.ne
                        br_if 0 (;@10;)
                        br 6 (;@4;)
                      end
                    end
                    local.get 12
                    i32.const -8
                    i32.add
                    local.set 15
                    i32.const 0
                    local.set 14
                  end
                  loop  ;; label = @8
                    local.get 11
                    local.get 14
                    i32.add
                    local.tee 13
                    i32.const 4
                    i32.add
                    i32.load
                    local.get 10
                    i32.xor
                    local.tee 16
                    i32.const -16843009
                    i32.add
                    local.get 16
                    i32.const -1
                    i32.xor
                    i32.and
                    local.get 13
                    i32.load
                    local.get 10
                    i32.xor
                    local.tee 13
                    i32.const -16843009
                    i32.add
                    local.get 13
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.or
                    i32.const -2139062144
                    i32.and
                    br_if 1 (;@7;)
                    local.get 14
                    i32.const 8
                    i32.add
                    local.tee 14
                    local.get 15
                    i32.le_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 14
                local.get 12
                i32.eq
                br_if 2 (;@4;)
                local.get 11
                local.get 14
                i32.add
                local.set 11
                local.get 4
                local.get 14
                i32.sub
                local.get 6
                i32.sub
                local.set 16
                i32.const 0
                local.set 13
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 11
                    local.get 13
                    i32.add
                    i32.load8_u
                    local.get 9
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 16
                    local.get 13
                    i32.const 1
                    i32.add
                    local.tee 13
                    i32.ne
                    br_if 0 (;@8;)
                    br 4 (;@4;)
                  end
                end
                local.get 13
                local.get 14
                i32.add
                local.set 13
              end
              local.get 1
              local.get 6
              local.get 13
              i32.add
              i32.const 1
              i32.add
              local.tee 6
              i32.store offset=12
              block  ;; label = @6
                local.get 6
                local.get 8
                i32.lt_u
                br_if 0 (;@6;)
                local.get 6
                local.get 5
                i32.le_u
                br_if 5 (;@1;)
              end
              local.get 4
              local.get 6
              i32.ge_u
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          local.get 1
          local.get 4
          i32.store offset=12
        end
        local.get 1
        i32.const 1
        i32.store8 offset=37
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load8_u offset=36
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=32
            local.set 10
            local.get 1
            i32.load offset=28
            local.set 9
            br 1 (;@3;)
          end
          local.get 1
          i32.load offset=32
          local.tee 10
          local.get 1
          i32.load offset=28
          local.tee 9
          i32.eq
          br_if 1 (;@2;)
        end
        local.get 3
        local.get 9
        i32.add
        local.set 2
        local.get 10
        local.get 9
        i32.sub
        local.set 13
      end
      local.get 0
      local.get 13
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      return
    end
    local.get 8
    i32.const 4
    i32.const 1048716
    call 3
    unreachable)
  (func (;3;) (type 4) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1049944
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 25
    unreachable)
  (func (;4;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.store offset=4
    local.get 1
    i32.load offset=20
    i32.const 1048698
    i32.const 13
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 0)
    local.set 0
    local.get 2
    i32.const 0
    i32.store8 offset=13
    local.get 2
    local.get 0
    i32.store8 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048711
    i32.const 4
    local.get 2
    i32.const 4
    i32.add
    i32.const 2
    call 5
    local.set 3
    local.get 2
    i32.load8_u offset=12
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load8_u offset=13
        br_if 0 (;@2;)
        local.get 0
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1
      local.set 1
      local.get 0
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.load
        local.tee 1
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        i32.const 1049599
        i32.const 2
        local.get 1
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=20
      i32.const 1049598
      i32.const 1
      local.get 1
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 0)
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func (;5;) (type 5) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 5
    global.set 0
    i32.const 1
    local.set 6
    block  ;; label = @1
      local.get 0
      i32.load8_u offset=4
      br_if 0 (;@1;)
      local.get 0
      i32.load8_u offset=5
      local.set 7
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 8
        i32.load offset=28
        local.tee 9
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1049591
        i32.const 1049588
        local.get 7
        i32.const 255
        i32.and
        local.tee 7
        select
        i32.const 2
        i32.const 3
        local.get 7
        select
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1049540
        i32.const 2
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 3
        local.get 8
        local.get 4
        call_indirect (type 1)
        local.set 6
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 7
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 1
        local.set 6
        local.get 8
        i32.load offset=20
        i32.const 1049593
        i32.const 3
        local.get 8
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 8
        i32.load offset=28
        local.set 9
      end
      i32.const 1
      local.set 6
      local.get 5
      i32.const 1
      i32.store8 offset=27
      local.get 5
      local.get 8
      i64.load offset=20 align=4
      i64.store offset=12 align=4
      local.get 5
      i32.const 1049560
      i32.store offset=52
      local.get 5
      local.get 5
      i32.const 27
      i32.add
      i32.store offset=20
      local.get 5
      local.get 8
      i64.load offset=8 align=4
      i64.store offset=36 align=4
      local.get 8
      i64.load align=4
      local.set 10
      local.get 5
      local.get 9
      i32.store offset=56
      local.get 5
      local.get 8
      i32.load offset=16
      i32.store offset=44
      local.get 5
      local.get 8
      i32.load8_u offset=32
      i32.store8 offset=60
      local.get 5
      local.get 10
      i64.store offset=28 align=4
      local.get 5
      local.get 5
      i32.const 12
      i32.add
      i32.store offset=48
      local.get 5
      i32.const 12
      i32.add
      local.get 1
      local.get 2
      call 46
      br_if 0 (;@1;)
      local.get 5
      i32.const 12
      i32.add
      i32.const 1049540
      i32.const 2
      call 46
      br_if 0 (;@1;)
      local.get 3
      local.get 5
      i32.const 28
      i32.add
      local.get 4
      call_indirect (type 1)
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=48
      i32.const 1049596
      i32.const 2
      local.get 5
      i32.load offset=52
      i32.load offset=12
      call_indirect (type 0)
      local.set 6
    end
    local.get 0
    i32.const 1
    i32.store8 offset=5
    local.get 0
    local.get 6
    i32.store8 offset=4
    local.get 5
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func (;6;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 3
    i32.store offset=44
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=1051848
        i32.const 3
        i32.eq
        br_if 0 (;@2;)
        local.get 2
        i32.const 1051844
        i32.store offset=88
        local.get 2
        local.get 2
        i32.const 127
        i32.add
        i32.store offset=92
        local.get 2
        local.get 2
        i32.const 44
        i32.add
        i32.store offset=84
        local.get 2
        i32.const 84
        i32.add
        call 8
        local.get 2
        i32.load offset=44
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.const 1051092
      i32.const 46
      call 0
    end
    local.get 2
    i32.const 1
    i32.store16 offset=80
    local.get 2
    i64.const 21474836480
    i64.store offset=72 align=4
    local.get 2
    i32.const 1
    i32.store8 offset=68
    local.get 2
    i64.const 197568495621
    i64.store offset=60 align=4
    local.get 2
    i64.const 5
    i64.store offset=52 align=4
    local.get 2
    i32.const 1048732
    i32.store offset=48
    local.get 2
    i32.const 46
    i32.store offset=44
    local.get 2
    i32.const 1
    i32.store16 offset=120
    local.get 2
    i64.const 21474836480
    i64.store offset=112 align=4
    local.get 2
    i32.const 1
    i32.store8 offset=108
    local.get 2
    i64.const 197568495621
    i64.store offset=100 align=4
    local.get 2
    i64.const 5
    i64.store offset=92 align=4
    local.get 2
    i32.const 1048732
    i32.store offset=88
    local.get 2
    i32.const 46
    i32.store offset=84
    i32.const -1
    local.set 3
    loop  ;; label = @1
      local.get 3
      i32.const 1
      i32.add
      local.set 3
      local.get 2
      i32.const 32
      i32.add
      local.get 2
      i32.const 84
      i32.add
      call 2
      local.get 2
      i32.load offset=32
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.const 3
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 2
                        i32.const 24
                        i32.add
                        local.get 2
                        i32.const 44
                        i32.add
                        call 2
                        local.get 2
                        i32.load offset=24
                        local.tee 3
                        i32.eqz
                        br_if 1 (;@9;)
                        i32.const 0
                        local.set 4
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 2
                            i32.load offset=28
                            local.tee 5
                            br_table 9 (;@3;) 0 (;@12;) 1 (;@11;)
                          end
                          i32.const 1
                          local.set 4
                          local.get 3
                          i32.load8_u
                          i32.const -43
                          i32.add
                          br_table 8 (;@3;) 4 (;@7;) 8 (;@3;) 4 (;@7;)
                        end
                        local.get 3
                        i32.load8_u
                        i32.const 43
                        i32.ne
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 1
                        i32.add
                        local.set 3
                        local.get 5
                        i32.const 6
                        i32.lt_u
                        local.set 6
                        local.get 5
                        i32.const -1
                        i32.add
                        local.tee 4
                        local.set 5
                        local.get 6
                        br_if 3 (;@7;)
                        br 4 (;@6;)
                      end
                      i32.const 0
                      local.set 3
                      i32.const 0
                      i32.const 1048900
                      i32.const 36
                      call 0
                      i32.const 0
                      local.set 5
                      i32.const 0
                      local.set 4
                      i32.const 0
                      local.set 6
                      br 8 (;@1;)
                    end
                    i32.const 1048748
                    call 9
                    unreachable
                  end
                  local.get 5
                  local.set 4
                  local.get 5
                  i32.const 5
                  i32.ge_u
                  br_if 1 (;@6;)
                end
                i32.const 0
                local.set 6
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.load8_u
                    i32.const -48
                    i32.add
                    local.tee 5
                    i32.const 9
                    i32.le_u
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 5 (;@3;)
                  end
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  local.get 6
                  i32.const 10
                  i32.mul
                  local.get 5
                  i32.add
                  local.set 6
                  local.get 4
                  i32.const -1
                  i32.add
                  local.tee 4
                  br_if 0 (;@7;)
                  br 2 (;@5;)
                end
              end
              i32.const 0
              local.set 6
              loop  ;; label = @6
                local.get 5
                i32.eqz
                br_if 1 (;@5;)
                local.get 3
                i32.load8_u
                i32.const -48
                i32.add
                local.tee 4
                i32.const 9
                i32.gt_u
                br_if 2 (;@4;)
                local.get 6
                i32.const 65535
                i32.and
                i32.const 10
                i32.mul
                local.tee 7
                i32.const 16
                i32.shr_u
                i32.const 0
                i32.ne
                br_if 2 (;@4;)
                local.get 7
                local.get 4
                i32.add
                local.set 6
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 5
                i32.const -1
                i32.add
                local.set 5
                local.get 7
                i32.const 65535
                i32.and
                local.get 4
                i32.const 65535
                i32.and
                i32.add
                local.tee 4
                i32.const 65535
                i32.and
                local.get 4
                i32.eq
                br_if 0 (;@6;)
              end
              i32.const 2
              local.set 4
              br 2 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.add
            local.get 2
            i32.const 44
            i32.add
            call 2
            local.get 2
            i32.load offset=16
            local.tee 3
            br_if 2 (;@2;)
            i32.const 1048764
            call 9
            unreachable
          end
          i32.const 1
          i32.const 2
          local.get 4
          i32.const 9
          i32.gt_u
          select
          local.set 4
        end
        local.get 2
        local.get 4
        i32.store8 offset=84
        i32.const 1048824
        i32.const 28
        local.get 2
        i32.const 84
        i32.add
        i32.const 1048808
        i32.const 1048884
        call 10
        unreachable
      end
      i32.const 0
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 2
                      i32.load offset=20
                      local.tee 7
                      br_table 6 (;@3;) 0 (;@9;) 1 (;@8;)
                    end
                    i32.const 1
                    local.set 5
                    local.get 3
                    i32.load8_u
                    i32.const -43
                    i32.add
                    br_table 5 (;@3;) 1 (;@7;) 5 (;@3;) 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 3
                    i32.load8_u
                    i32.const 43
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 1
                    i32.add
                    local.set 3
                    local.get 7
                    i32.const 6
                    i32.lt_u
                    local.set 4
                    local.get 7
                    i32.const -1
                    i32.add
                    local.tee 5
                    local.set 7
                    local.get 4
                    br_if 1 (;@7;)
                    br 2 (;@6;)
                  end
                  local.get 7
                  local.set 5
                  local.get 7
                  i32.const 5
                  i32.ge_u
                  br_if 1 (;@6;)
                end
                i32.const 0
                local.set 4
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.load8_u
                    i32.const -48
                    i32.add
                    local.tee 7
                    i32.const 9
                    i32.le_u
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 5
                    br 5 (;@3;)
                  end
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  local.get 4
                  i32.const 10
                  i32.mul
                  local.get 7
                  i32.add
                  local.set 4
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 5
                  br_if 0 (;@7;)
                  br 2 (;@5;)
                end
              end
              i32.const 0
              local.set 4
              loop  ;; label = @6
                local.get 7
                i32.eqz
                br_if 1 (;@5;)
                local.get 3
                i32.load8_u
                i32.const -48
                i32.add
                local.tee 5
                i32.const 9
                i32.gt_u
                br_if 2 (;@4;)
                local.get 4
                i32.const 65535
                i32.and
                i32.const 10
                i32.mul
                local.tee 8
                i32.const 16
                i32.shr_u
                i32.const 0
                i32.ne
                br_if 2 (;@4;)
                local.get 8
                local.get 5
                i32.add
                local.set 4
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 7
                i32.const -1
                i32.add
                local.set 7
                local.get 8
                i32.const 65535
                i32.and
                local.get 5
                i32.const 65535
                i32.and
                i32.add
                local.tee 5
                i32.const 65535
                i32.and
                local.get 5
                i32.eq
                br_if 0 (;@6;)
              end
              i32.const 2
              local.set 5
              br 2 (;@3;)
            end
            local.get 2
            i32.const 8
            i32.add
            local.get 2
            i32.const 44
            i32.add
            call 2
            local.get 2
            i32.load offset=8
            local.tee 3
            br_if 2 (;@2;)
            i32.const 1048780
            call 9
            unreachable
          end
          i32.const 1
          i32.const 2
          local.get 5
          i32.const 9
          i32.gt_u
          select
          local.set 5
        end
        local.get 2
        local.get 5
        i32.store8 offset=84
        i32.const 1048824
        i32.const 28
        local.get 2
        i32.const 84
        i32.add
        i32.const 1048808
        i32.const 1048868
        call 10
        unreachable
      end
      i32.const 0
      local.set 7
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.load offset=12
                    local.tee 8
                    br_table 6 (;@2;) 0 (;@8;) 1 (;@7;)
                  end
                  i32.const 1
                  local.set 7
                  local.get 3
                  i32.load8_u
                  i32.const -43
                  i32.add
                  br_table 5 (;@2;) 1 (;@6;) 5 (;@2;) 1 (;@6;)
                end
                block  ;; label = @7
                  local.get 3
                  i32.load8_u
                  i32.const 43
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 1
                  i32.add
                  local.set 3
                  local.get 8
                  i32.const 6
                  i32.lt_u
                  local.set 5
                  local.get 8
                  i32.const -1
                  i32.add
                  local.tee 7
                  local.set 8
                  local.get 5
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                local.get 8
                local.set 7
                local.get 8
                i32.const 5
                i32.ge_u
                br_if 1 (;@5;)
              end
              i32.const 0
              local.set 5
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load8_u
                  i32.const -48
                  i32.add
                  local.tee 8
                  i32.const 9
                  i32.le_u
                  br_if 0 (;@7;)
                  i32.const 1
                  local.set 7
                  br 5 (;@2;)
                end
                local.get 3
                i32.const 1
                i32.add
                local.set 3
                local.get 5
                i32.const 10
                i32.mul
                local.get 8
                i32.add
                local.set 5
                local.get 7
                i32.const -1
                i32.add
                local.tee 7
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            i32.const 0
            local.set 5
            loop  ;; label = @5
              local.get 8
              i32.eqz
              br_if 1 (;@4;)
              local.get 3
              i32.load8_u
              i32.const -48
              i32.add
              local.tee 7
              i32.const 9
              i32.gt_u
              br_if 2 (;@3;)
              local.get 5
              i32.const 65535
              i32.and
              i32.const 10
              i32.mul
              local.tee 9
              i32.const 16
              i32.shr_u
              i32.const 0
              i32.ne
              br_if 2 (;@3;)
              local.get 9
              local.get 7
              i32.add
              local.set 5
              local.get 3
              i32.const 1
              i32.add
              local.set 3
              local.get 8
              i32.const -1
              i32.add
              local.set 8
              local.get 9
              i32.const 65535
              i32.and
              local.get 7
              i32.const 65535
              i32.and
              i32.add
              local.tee 7
              i32.const 65535
              i32.and
              local.get 7
              i32.eq
              br_if 0 (;@5;)
            end
            i32.const 2
            local.set 7
            br 2 (;@2;)
          end
          i32.const 2
          i32.const 1048796
          i32.const 11
          call 0
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        i32.const 1
        i32.const 2
        local.get 7
        i32.const 9
        i32.gt_u
        select
        local.set 7
      end
      local.get 2
      local.get 7
      i32.store8 offset=84
      i32.const 1048824
      i32.const 28
      local.get 2
      i32.const 84
      i32.add
      i32.const 1048808
      i32.const 1048852
      call 10
      unreachable
    end
    local.get 0
    local.get 3
    i32.store8 offset=32
    local.get 0
    local.get 5
    i32.store16 offset=30
    local.get 0
    local.get 4
    i32.store16 offset=28
    local.get 0
    local.get 6
    i32.store16 offset=26
    local.get 0
    i32.const 0
    i32.store16 offset=24
    local.get 0
    i64.const 0
    i64.store offset=16
    local.get 0
    i64.const 0
    i64.store offset=8
    local.get 0
    i64.const 126935064932194
    i64.store
    local.get 2
    i32.const 128
    i32.add
    global.set 0)
  (func (;7;) (type 3)
    i64.const 40
    call 11
    drop)
  (func (;8;) (type 6) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load8_u offset=1051848
              local.tee 2
              i32.const 2
              i32.lt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const -2
              i32.add
              br_table 4 (;@1;) 1 (;@4;) 4 (;@1;)
            end
            i32.const 0
            i32.const 2
            i32.store8 offset=1051848
            local.get 0
            i32.load
            local.set 2
            local.get 0
            i32.const 0
            i32.store
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.load offset=4
            local.set 3
            local.get 2
            i32.load
            local.set 0
            local.get 2
            i32.const 0
            i32.store
            local.get 0
            i32.eqz
            br_if 2 (;@2;)
            local.get 3
            local.get 0
            i32.store
            i32.const 0
            i32.const 3
            i32.store8 offset=1051848
          end
          local.get 1
          i32.const 32
          i32.add
          global.set 0
          return
        end
        i32.const 1050592
        call 9
        unreachable
      end
      i32.const 1050844
      call 9
      unreachable
    end
    local.get 1
    i32.const 0
    i32.store offset=24
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1050492
    i32.store offset=8
    local.get 1
    i64.const 4
    i64.store offset=16 align=4
    local.get 1
    i32.const 8
    i32.add
    i32.const 1050576
    call 25
    unreachable)
  (func (;9;) (type 6) (param i32)
    i32.const 1049292
    i32.const 43
    local.get 0
    call 22
    unreachable)
  (func (;10;) (type 7) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 5
    global.set 0
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1049544
    i32.store offset=24
    local.get 5
    i64.const 2
    i64.store offset=36 align=4
    local.get 5
    i32.const 4
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 5
    i32.const 5
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call 25
    unreachable)
  (func (;11;) (type 8) (param i64) (result i64)
    (local i64)
    i64.const 0
    local.set 1
    block  ;; label = @1
      local.get 0
      i64.const 2
      i64.lt_u
      br_if 0 (;@1;)
      local.get 0
      i64.const 1
      i64.add
      local.set 0
      i64.const 0
      local.set 1
      loop  ;; label = @2
        local.get 0
        i64.const -3
        i64.add
        call 11
        local.get 1
        i64.add
        local.set 1
        local.get 0
        i64.const -1
        i64.add
        local.tee 0
        i64.const 2
        i64.gt_u
        br_if 0 (;@2;)
      end
      i64.const 1
      local.set 0
    end
    local.get 0
    local.get 1
    i64.add)
  (func (;12;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load8_u offset=1051840
                    i32.const 3
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load8_u offset=1051828
                    local.set 3
                    i32.const 0
                    i32.const 1
                    i32.store8 offset=1051828
                    local.get 2
                    local.get 3
                    i32.store8 offset=7
                    local.get 3
                    br_if 1 (;@7;)
                    i32.const 0
                    local.set 3
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051828
                    local.get 1
                    i32.const 8
                    i32.add
                    local.tee 4
                    i32.const 0
                    i32.load offset=1051836
                    local.tee 5
                    i32.gt_u
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051828
                    local.get 5
                    local.get 0
                    i32.lt_u
                    br_if 4 (;@4;)
                    i32.const 0
                    i32.const 1
                    i32.store8 offset=1051828
                    local.get 5
                    local.get 0
                    i32.le_u
                    br_if 3 (;@5;)
                    i32.const 0
                    i32.load offset=1051832
                    local.tee 5
                    local.get 0
                    i32.add
                    i64.load8_u
                    local.set 6
                    i32.const 0
                    i32.const 0
                    i32.store8 offset=1051828
                    block  ;; label = @9
                      local.get 6
                      i64.const 93
                      i64.gt_u
                      br_if 0 (;@9;)
                      i32.const 1
                      local.set 3
                      local.get 6
                      call 11
                      local.set 6
                      i32.const 0
                      i32.const 1
                      i32.store8 offset=1051828
                      local.get 1
                      i32.const -8
                      i32.ge_u
                      br_if 6 (;@3;)
                      local.get 5
                      local.get 1
                      i32.add
                      local.get 6
                      i64.store align=1
                      i32.const 0
                      i32.const 0
                      i32.store8 offset=1051828
                      br 8 (;@1;)
                    end
                    i32.const 2
                    i32.const 1048936
                    i32.const 18
                    call 0
                    br 6 (;@2;)
                  end
                  call 13
                  unreachable
                end
                local.get 2
                i64.const 0
                i64.store offset=20 align=4
                local.get 2
                i64.const 17179869185
                i64.store offset=12 align=4
                local.get 2
                i32.const 1050640
                i32.store offset=8
                local.get 2
                i32.const 7
                i32.add
                local.get 2
                i32.const 8
                i32.add
                call 14
                unreachable
              end
              i32.const 2
              i32.const 1048968
              i32.const 21
              call 0
              br 4 (;@1;)
            end
            local.get 0
            local.get 5
            i32.const 1051060
            call 15
            unreachable
          end
          i32.const 2
          i32.const 1048954
          i32.const 14
          call 0
          br 1 (;@2;)
        end
        local.get 1
        local.get 4
        i32.const 1051044
        call 16
        unreachable
      end
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 3)
  (func (;13;) (type 3)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 30
    i32.store offset=12
    local.get 0
    i32.const 1050884
    i32.store offset=8
    local.get 0
    i32.const 1
    i32.store offset=20
    local.get 0
    i32.const 1049284
    i32.store offset=16
    local.get 0
    i64.const 1
    i64.store offset=28 align=4
    local.get 0
    i32.const 5
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 0
    local.get 0
    i32.const 40
    i32.add
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    i32.const 1050980
    call 25
    unreachable)
  (func (;14;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 1050648
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 1
    call 42
    unreachable)
  (func (;15;) (type 4) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1049388
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 25
    unreachable)
  (func (;16;) (type 4) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    local.get 0
    i32.store
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1049996
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call 25
    unreachable)
  (func (;17;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -4
          i32.add
          local.tee 3
          i32.load
          local.tee 4
          i32.const -8
          i32.and
          local.tee 5
          i32.const 4
          i32.const 8
          local.get 4
          i32.const 3
          i32.and
          local.tee 6
          select
          local.get 1
          i32.add
          i32.lt_u
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 1
            i32.const 39
            i32.add
            i32.gt_u
            br_if 2 (;@2;)
          end
          i32.const 16
          local.get 2
          i32.const 11
          i32.add
          i32.const -8
          i32.and
          local.get 2
          i32.const 11
          i32.lt_u
          select
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 6
                br_if 0 (;@6;)
                local.get 1
                i32.const 256
                i32.lt_u
                br_if 1 (;@5;)
                local.get 5
                local.get 1
                i32.const 4
                i32.or
                i32.lt_u
                br_if 1 (;@5;)
                local.get 5
                local.get 1
                i32.sub
                i32.const 131073
                i32.ge_u
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              local.get 0
              i32.const -8
              i32.add
              local.tee 7
              local.get 5
              i32.add
              local.set 6
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 5
                      local.get 1
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 6
                      i32.const 0
                      i32.load offset=1051796
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 6
                      i32.const 0
                      i32.load offset=1051792
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 6
                      i32.load offset=4
                      local.tee 4
                      i32.const 2
                      i32.and
                      br_if 4 (;@5;)
                      local.get 4
                      i32.const -8
                      i32.and
                      local.tee 4
                      local.get 5
                      i32.add
                      local.tee 5
                      local.get 1
                      i32.lt_u
                      br_if 4 (;@5;)
                      local.get 6
                      local.get 4
                      call 18
                      local.get 5
                      local.get 1
                      i32.sub
                      local.tee 2
                      i32.const 16
                      i32.lt_u
                      br_if 1 (;@8;)
                      local.get 3
                      local.get 1
                      local.get 3
                      i32.load
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 2
                      i32.or
                      i32.store
                      local.get 7
                      local.get 1
                      i32.add
                      local.tee 1
                      local.get 2
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 5
                      i32.add
                      local.tee 5
                      local.get 5
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 2
                      call 19
                      local.get 0
                      return
                    end
                    local.get 5
                    local.get 1
                    i32.sub
                    local.tee 2
                    i32.const 15
                    i32.le_u
                    br_if 4 (;@4;)
                    local.get 3
                    local.get 1
                    local.get 4
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get 7
                    local.get 1
                    i32.add
                    local.tee 5
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 6
                    local.get 6
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 5
                    local.get 2
                    call 19
                    local.get 0
                    return
                  end
                  local.get 3
                  local.get 5
                  local.get 3
                  i32.load
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 7
                  local.get 5
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  return
                end
                i32.const 0
                i32.load offset=1051784
                local.get 5
                i32.add
                local.tee 5
                local.get 1
                i32.lt_u
                br_if 1 (;@5;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 5
                    local.get 1
                    i32.sub
                    local.tee 2
                    i32.const 15
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 3
                    local.get 4
                    i32.const 1
                    i32.and
                    local.get 5
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get 7
                    local.get 5
                    i32.add
                    local.tee 2
                    local.get 2
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    i32.const 0
                    local.set 2
                    i32.const 0
                    local.set 1
                    br 1 (;@7;)
                  end
                  local.get 3
                  local.get 1
                  local.get 4
                  i32.const 1
                  i32.and
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 7
                  local.get 1
                  i32.add
                  local.tee 1
                  local.get 2
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 7
                  local.get 5
                  i32.add
                  local.tee 5
                  local.get 2
                  i32.store
                  local.get 5
                  local.get 5
                  i32.load offset=4
                  i32.const -2
                  i32.and
                  i32.store offset=4
                end
                i32.const 0
                local.get 1
                i32.store offset=1051792
                i32.const 0
                local.get 2
                i32.store offset=1051784
                local.get 0
                return
              end
              i32.const 0
              i32.load offset=1051788
              local.get 5
              i32.add
              local.tee 5
              local.get 1
              i32.gt_u
              br_if 4 (;@1;)
            end
            block  ;; label = @5
              local.get 2
              call 20
              local.tee 5
              br_if 0 (;@5;)
              i32.const 0
              return
            end
            local.get 5
            local.get 0
            i32.const -4
            i32.const -8
            local.get 3
            i32.load
            local.tee 1
            i32.const 3
            i32.and
            select
            local.get 1
            i32.const -8
            i32.and
            i32.add
            local.tee 1
            local.get 2
            local.get 1
            local.get 2
            i32.lt_u
            select
            call 71
            local.set 2
            local.get 0
            call 21
            local.get 2
            local.set 0
          end
          local.get 0
          return
        end
        i32.const 1050309
        i32.const 46
        i32.const 1050356
        call 22
        unreachable
      end
      i32.const 1050372
      i32.const 46
      i32.const 1050420
      call 22
      unreachable
    end
    local.get 3
    local.get 1
    local.get 4
    i32.const 1
    i32.and
    i32.or
    i32.const 2
    i32.or
    i32.store
    local.get 7
    local.get 1
    i32.add
    local.tee 2
    local.get 5
    local.get 1
    i32.sub
    local.tee 5
    i32.const 1
    i32.or
    i32.store offset=4
    i32.const 0
    local.get 5
    i32.store offset=1051788
    i32.const 0
    local.get 2
    i32.store offset=1051796
    local.get 0)
  (func (;18;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 256
          i32.lt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=24
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 0
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const 20
                i32.const 16
                local.get 0
                i32.load offset=20
                local.tee 2
                select
                i32.add
                i32.load
                local.tee 1
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 2 (;@4;)
              end
              local.get 0
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 16
            i32.add
            local.get 2
            select
            local.set 4
            loop  ;; label = @5
              local.get 4
              local.set 5
              local.get 1
              local.tee 2
              i32.const 20
              i32.add
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.load offset=20
              local.tee 1
              select
              local.set 4
              local.get 2
              i32.const 20
              i32.const 16
              local.get 1
              select
              i32.add
              i32.load
              local.tee 1
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 0
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            local.tee 1
            i32.load
            local.get 0
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.const 20
            local.get 3
            i32.load offset=16
            local.get 0
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 2
          i32.store
          local.get 2
          br_if 1 (;@2;)
          i32.const 0
          i32.const 0
          i32.load offset=1051780
          i32.const -2
          local.get 0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051780
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.load offset=8
          local.tee 4
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 2
          local.get 4
          i32.store offset=8
          return
        end
        i32.const 0
        i32.const 0
        i32.load offset=1051776
        i32.const -2
        local.get 1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1051776
        return
      end
      local.get 2
      local.get 3
      i32.store offset=24
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=16
        local.get 1
        local.get 2
        i32.store offset=24
      end
      local.get 0
      i32.load offset=20
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.store offset=20
      local.get 1
      local.get 2
      i32.store offset=24
      return
    end)
  (func (;19;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          local.get 0
          local.get 3
          i32.sub
          local.tee 0
          i32.const 0
          i32.load offset=1051792
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1051784
          local.get 2
          local.get 2
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        call 18
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 3
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.load offset=1051796
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.load offset=1051792
              i32.eq
              br_if 3 (;@2;)
              local.get 2
              local.get 3
              i32.const -8
              i32.and
              local.tee 3
              call 18
              local.get 0
              local.get 3
              local.get 1
              i32.add
              local.tee 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.get 1
              i32.store
              local.get 0
              i32.const 0
              i32.load offset=1051792
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 1
              i32.store offset=1051784
              return
            end
            local.get 2
            local.get 3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
          end
          block  ;; label = @4
            local.get 1
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 31
            local.set 2
            block  ;; label = @5
              local.get 1
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 6
              local.get 1
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 2
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 2
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 2
            end
            local.get 0
            i64.const 0
            i64.store offset=16 align=4
            local.get 0
            local.get 2
            i32.store offset=28
            local.get 2
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            local.set 3
            block  ;; label = @5
              i32.const 0
              i32.load offset=1051780
              i32.const 1
              local.get 2
              i32.shl
              local.tee 4
              i32.and
              br_if 0 (;@5;)
              local.get 3
              local.get 0
              i32.store
              local.get 0
              local.get 3
              i32.store offset=24
              local.get 0
              local.get 0
              i32.store offset=12
              local.get 0
              local.get 0
              i32.store offset=8
              i32.const 0
              i32.const 0
              i32.load offset=1051780
              local.get 4
              i32.or
              i32.store offset=1051780
              return
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.load
                  local.tee 4
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 1
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 4
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 1
                i32.const 0
                i32.const 25
                local.get 2
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 2
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 3
                loop  ;; label = @7
                  local.get 4
                  local.get 3
                  i32.const 29
                  i32.shr_u
                  i32.const 4
                  i32.and
                  i32.add
                  i32.const 16
                  i32.add
                  local.tee 5
                  i32.load
                  local.tee 2
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 1
                  i32.shl
                  local.set 3
                  local.get 2
                  local.set 4
                  local.get 2
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 1
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 2
              i32.load offset=8
              local.tee 1
              local.get 0
              i32.store offset=12
              local.get 2
              local.get 0
              i32.store offset=8
              local.get 0
              i32.const 0
              i32.store offset=24
              local.get 0
              local.get 2
              i32.store offset=12
              local.get 0
              local.get 1
              i32.store offset=8
              return
            end
            local.get 5
            local.get 0
            i32.store
            local.get 0
            local.get 4
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            return
          end
          local.get 1
          i32.const -8
          i32.and
          i32.const 1051512
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1051776
              local.tee 3
              i32.const 1
              local.get 1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 1
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 3
              local.get 1
              i32.or
              i32.store offset=1051776
              local.get 2
              local.set 1
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.set 1
          end
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          return
        end
        i32.const 0
        local.get 0
        i32.store offset=1051796
        i32.const 0
        i32.const 0
        i32.load offset=1051788
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=1051788
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 0
        i32.load offset=1051792
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store offset=1051784
        i32.const 0
        i32.const 0
        i32.store offset=1051792
        return
      end
      i32.const 0
      local.get 0
      i32.store offset=1051792
      i32.const 0
      i32.const 0
      i32.load offset=1051784
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1051784
      local.get 0
      local.get 1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.get 1
      i32.store
      return
    end)
  (func (;20;) (type 9) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const 244
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load offset=1051776
                    local.tee 1
                    i32.const 16
                    local.get 0
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get 0
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee 2
                    i32.const 3
                    i32.shr_u
                    local.tee 3
                    i32.shr_u
                    local.tee 0
                    i32.const 3
                    i32.and
                    br_if 1 (;@7;)
                    local.get 2
                    i32.const 0
                    i32.load offset=1051784
                    i32.le_u
                    br_if 7 (;@1;)
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.load offset=1051780
                    local.tee 0
                    br_if 3 (;@5;)
                    br 7 (;@1;)
                  end
                  local.get 0
                  i32.const 11
                  i32.add
                  local.tee 0
                  i32.const -8
                  i32.and
                  local.set 2
                  i32.const 0
                  i32.load offset=1051780
                  local.tee 4
                  i32.eqz
                  br_if 6 (;@1;)
                  i32.const 0
                  local.set 5
                  block  ;; label = @8
                    local.get 2
                    i32.const 256
                    i32.lt_u
                    br_if 0 (;@8;)
                    i32.const 31
                    local.set 5
                    local.get 2
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 2
                    i32.const 6
                    local.get 0
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 0
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 0
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 5
                  end
                  i32.const 0
                  local.get 2
                  i32.sub
                  local.set 3
                  block  ;; label = @8
                    local.get 5
                    i32.const 2
                    i32.shl
                    i32.const 1051368
                    i32.add
                    i32.load
                    local.tee 1
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 0
                    i32.const 0
                    local.set 6
                    br 4 (;@4;)
                  end
                  i32.const 0
                  local.set 0
                  local.get 2
                  i32.const 0
                  i32.const 25
                  local.get 5
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 5
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 7
                  i32.const 0
                  local.set 6
                  loop  ;; label = @8
                    block  ;; label = @9
                      local.get 1
                      local.tee 1
                      i32.load offset=4
                      i32.const -8
                      i32.and
                      local.tee 8
                      local.get 2
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 8
                      local.get 2
                      i32.sub
                      local.tee 8
                      local.get 3
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 8
                      local.set 3
                      local.get 1
                      local.set 6
                      local.get 8
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 3
                      local.get 1
                      local.set 6
                      local.get 1
                      local.set 0
                      br 6 (;@3;)
                    end
                    local.get 1
                    i32.load offset=20
                    local.tee 8
                    local.get 0
                    local.get 8
                    local.get 1
                    local.get 7
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    i32.load
                    local.tee 1
                    i32.ne
                    select
                    local.get 0
                    local.get 8
                    select
                    local.set 0
                    local.get 7
                    i32.const 1
                    i32.shl
                    local.set 7
                    local.get 1
                    i32.eqz
                    br_if 4 (;@4;)
                    br 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.const 1
                    i32.and
                    local.get 3
                    i32.add
                    local.tee 3
                    i32.const 3
                    i32.shl
                    local.tee 0
                    i32.const 1051512
                    i32.add
                    local.tee 2
                    local.get 0
                    i32.const 1051520
                    i32.add
                    i32.load
                    local.tee 0
                    i32.load offset=8
                    local.tee 6
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 6
                    local.get 2
                    i32.store offset=12
                    local.get 2
                    local.get 6
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 1
                  i32.const -2
                  local.get 3
                  i32.rotl
                  i32.and
                  i32.store offset=1051776
                end
                local.get 0
                local.get 3
                i32.const 3
                i32.shl
                local.tee 3
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 0
                local.get 3
                i32.add
                local.tee 3
                local.get 3
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                i32.const 8
                i32.add
                return
              end
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  local.get 3
                  i32.shl
                  i32.const 2
                  local.get 3
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  i32.and
                  i32.ctz
                  local.tee 3
                  i32.const 3
                  i32.shl
                  local.tee 0
                  i32.const 1051512
                  i32.add
                  local.tee 6
                  local.get 0
                  i32.const 1051520
                  i32.add
                  i32.load
                  local.tee 0
                  i32.load offset=8
                  local.tee 7
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 6
                  i32.store offset=12
                  local.get 6
                  local.get 7
                  i32.store offset=8
                  br 1 (;@6;)
                end
                i32.const 0
                local.get 1
                i32.const -2
                local.get 3
                i32.rotl
                i32.and
                i32.store offset=1051776
              end
              local.get 0
              local.get 2
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              local.get 2
              i32.add
              local.tee 7
              local.get 3
              i32.const 3
              i32.shl
              local.tee 3
              local.get 2
              i32.sub
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 2
              i32.store
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051784
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const -8
                i32.and
                i32.const 1051512
                i32.add
                local.set 6
                i32.const 0
                i32.load offset=1051792
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051776
                    local.tee 8
                    i32.const 1
                    local.get 1
                    i32.const 3
                    i32.shr_u
                    i32.shl
                    local.tee 1
                    i32.and
                    br_if 0 (;@8;)
                    i32.const 0
                    local.get 8
                    local.get 1
                    i32.or
                    i32.store offset=1051776
                    local.get 6
                    local.set 1
                    br 1 (;@7;)
                  end
                  local.get 6
                  i32.load offset=8
                  local.set 1
                end
                local.get 6
                local.get 3
                i32.store offset=8
                local.get 1
                local.get 3
                i32.store offset=12
                local.get 3
                local.get 6
                i32.store offset=12
                local.get 3
                local.get 1
                i32.store offset=8
              end
              i32.const 0
              local.get 7
              i32.store offset=1051792
              i32.const 0
              local.get 2
              i32.store offset=1051784
              local.get 0
              i32.const 8
              i32.add
              return
            end
            local.get 0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            i32.load
            local.tee 6
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.sub
            local.set 3
            local.get 6
            local.set 1
            block  ;; label = @5
              block  ;; label = @6
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 6
                    i32.load offset=16
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 6
                    i32.load offset=20
                    local.tee 0
                    br_if 0 (;@8;)
                    local.get 1
                    i32.load offset=24
                    local.set 5
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.load offset=12
                          local.tee 0
                          local.get 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 1
                          i32.const 20
                          i32.const 16
                          local.get 1
                          i32.load offset=20
                          local.tee 0
                          select
                          i32.add
                          i32.load
                          local.tee 6
                          br_if 1 (;@10;)
                          i32.const 0
                          local.set 0
                          br 2 (;@9;)
                        end
                        local.get 1
                        i32.load offset=8
                        local.tee 6
                        local.get 0
                        i32.store offset=12
                        local.get 0
                        local.get 6
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 1
                      i32.const 20
                      i32.add
                      local.get 1
                      i32.const 16
                      i32.add
                      local.get 0
                      select
                      local.set 7
                      loop  ;; label = @10
                        local.get 7
                        local.set 8
                        local.get 6
                        local.tee 0
                        i32.const 20
                        i32.add
                        local.get 0
                        i32.const 16
                        i32.add
                        local.get 0
                        i32.load offset=20
                        local.tee 6
                        select
                        local.set 7
                        local.get 0
                        i32.const 20
                        i32.const 16
                        local.get 6
                        select
                        i32.add
                        i32.load
                        local.tee 6
                        br_if 0 (;@10;)
                      end
                      local.get 8
                      i32.const 0
                      i32.store
                    end
                    local.get 5
                    i32.eqz
                    br_if 3 (;@5;)
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=28
                      i32.const 2
                      i32.shl
                      i32.const 1051368
                      i32.add
                      local.tee 6
                      i32.load
                      local.get 1
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 16
                      i32.const 20
                      local.get 5
                      i32.load offset=16
                      local.get 1
                      i32.eq
                      select
                      i32.add
                      local.get 0
                      i32.store
                      local.get 0
                      i32.eqz
                      br_if 4 (;@5;)
                      br 3 (;@6;)
                    end
                    local.get 6
                    local.get 0
                    i32.store
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051780
                    i32.const -2
                    local.get 1
                    i32.load offset=28
                    i32.rotl
                    i32.and
                    i32.store offset=1051780
                    br 3 (;@5;)
                  end
                  local.get 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 2
                  i32.sub
                  local.tee 6
                  local.get 3
                  local.get 6
                  local.get 3
                  i32.lt_u
                  local.tee 6
                  select
                  local.set 3
                  local.get 0
                  local.get 1
                  local.get 6
                  select
                  local.set 1
                  local.get 0
                  local.set 6
                  br 0 (;@7;)
                end
              end
              local.get 0
              local.get 5
              i32.store offset=24
              block  ;; label = @6
                local.get 1
                i32.load offset=16
                local.tee 6
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 6
                i32.store offset=16
                local.get 6
                local.get 0
                i32.store offset=24
              end
              local.get 1
              i32.load offset=20
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.get 6
              i32.store offset=20
              local.get 6
              local.get 0
              i32.store offset=24
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 16
                  i32.lt_u
                  br_if 0 (;@7;)
                  local.get 1
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 2
                  i32.add
                  local.tee 2
                  local.get 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 2
                  local.get 3
                  i32.add
                  local.get 3
                  i32.store
                  i32.const 0
                  i32.load offset=1051784
                  local.tee 7
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 7
                  i32.const -8
                  i32.and
                  i32.const 1051512
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=1051792
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1051776
                      local.tee 8
                      i32.const 1
                      local.get 7
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 7
                      i32.and
                      br_if 0 (;@9;)
                      i32.const 0
                      local.get 8
                      local.get 7
                      i32.or
                      i32.store offset=1051776
                      local.get 6
                      local.set 7
                      br 1 (;@8;)
                    end
                    local.get 6
                    i32.load offset=8
                    local.set 7
                  end
                  local.get 6
                  local.get 0
                  i32.store offset=8
                  local.get 7
                  local.get 0
                  i32.store offset=12
                  local.get 0
                  local.get 6
                  i32.store offset=12
                  local.get 0
                  local.get 7
                  i32.store offset=8
                  br 1 (;@6;)
                end
                local.get 1
                local.get 3
                local.get 2
                i32.add
                local.tee 0
                i32.const 3
                i32.or
                i32.store offset=4
                local.get 1
                local.get 0
                i32.add
                local.tee 0
                local.get 0
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              i32.const 0
              local.get 2
              i32.store offset=1051792
              i32.const 0
              local.get 3
              i32.store offset=1051784
            end
            local.get 1
            i32.const 8
            i32.add
            return
          end
          block  ;; label = @4
            local.get 0
            local.get 6
            i32.or
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            i32.const 2
            local.get 5
            i32.shl
            local.tee 0
            i32.const 0
            local.get 0
            i32.sub
            i32.or
            local.get 4
            i32.and
            local.tee 0
            i32.eqz
            br_if 3 (;@1;)
            local.get 0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            i32.load
            local.set 0
          end
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
        end
        loop  ;; label = @3
          local.get 0
          local.get 6
          local.get 0
          i32.load offset=4
          i32.const -8
          i32.and
          local.tee 1
          local.get 2
          i32.sub
          local.tee 8
          local.get 3
          i32.lt_u
          local.tee 5
          select
          local.set 4
          local.get 1
          local.get 2
          i32.lt_u
          local.set 7
          local.get 8
          local.get 3
          local.get 5
          select
          local.set 8
          block  ;; label = @4
            local.get 0
            i32.load offset=16
            local.tee 1
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=20
            local.set 1
          end
          local.get 6
          local.get 4
          local.get 7
          select
          local.set 6
          local.get 3
          local.get 8
          local.get 7
          select
          local.set 3
          local.get 1
          local.set 0
          local.get 1
          br_if 0 (;@3;)
        end
      end
      local.get 6
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051784
        local.tee 0
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        local.get 2
        i32.sub
        i32.ge_u
        br_if 1 (;@1;)
      end
      local.get 6
      i32.load offset=24
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load offset=12
            local.tee 0
            local.get 6
            i32.ne
            br_if 0 (;@4;)
            local.get 6
            i32.const 20
            i32.const 16
            local.get 6
            i32.load offset=20
            local.tee 0
            select
            i32.add
            i32.load
            local.tee 1
            br_if 1 (;@3;)
            i32.const 0
            local.set 0
            br 2 (;@2;)
          end
          local.get 6
          i32.load offset=8
          local.tee 1
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 6
        i32.const 20
        i32.add
        local.get 6
        i32.const 16
        i32.add
        local.get 0
        select
        local.set 7
        loop  ;; label = @3
          local.get 7
          local.set 8
          local.get 1
          local.tee 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 16
          i32.add
          local.get 0
          i32.load offset=20
          local.tee 1
          select
          local.set 7
          local.get 0
          i32.const 20
          i32.const 16
          local.get 1
          select
          i32.add
          i32.load
          local.tee 1
          br_if 0 (;@3;)
        end
        local.get 8
        i32.const 0
        i32.store
      end
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            local.tee 1
            i32.load
            local.get 6
            i32.eq
            br_if 0 (;@4;)
            local.get 5
            i32.const 16
            i32.const 20
            local.get 5
            i32.load offset=16
            local.get 6
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 1
          local.get 0
          i32.store
          local.get 0
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1051780
          i32.const -2
          local.get 6
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1051780
          br 1 (;@2;)
        end
        local.get 0
        local.get 5
        i32.store offset=24
        block  ;; label = @3
          local.get 6
          i32.load offset=16
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 0
          i32.store offset=24
        end
        local.get 6
        i32.load offset=20
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.store offset=20
        local.get 1
        local.get 0
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 6
          local.get 2
          i32.add
          local.tee 2
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 31
            local.set 0
            block  ;; label = @5
              local.get 3
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 6
              local.get 3
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 0
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 0
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 0
            end
            local.get 2
            i64.const 0
            i64.store offset=16 align=4
            local.get 2
            local.get 0
            i32.store offset=28
            local.get 0
            i32.const 2
            i32.shl
            i32.const 1051368
            i32.add
            local.set 1
            block  ;; label = @5
              i32.const 0
              i32.load offset=1051780
              i32.const 1
              local.get 0
              i32.shl
              local.tee 7
              i32.and
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.store
              local.get 2
              local.get 1
              i32.store offset=24
              local.get 2
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 2
              i32.store offset=8
              i32.const 0
              i32.const 0
              i32.load offset=1051780
              local.get 7
              i32.or
              i32.store offset=1051780
              br 3 (;@2;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 1
                  i32.load
                  local.tee 7
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 3
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 7
                  local.set 0
                  br 1 (;@6;)
                end
                local.get 3
                i32.const 0
                i32.const 25
                local.get 0
                i32.const 1
                i32.shr_u
                i32.sub
                local.get 0
                i32.const 31
                i32.eq
                select
                i32.shl
                local.set 1
                loop  ;; label = @7
                  local.get 7
                  local.get 1
                  i32.const 29
                  i32.shr_u
                  i32.const 4
                  i32.and
                  i32.add
                  i32.const 16
                  i32.add
                  local.tee 8
                  i32.load
                  local.tee 0
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 1
                  i32.const 1
                  i32.shl
                  local.set 1
                  local.get 0
                  local.set 7
                  local.get 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 3
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 0
              i32.load offset=8
              local.tee 3
              local.get 2
              i32.store offset=12
              local.get 0
              local.get 2
              i32.store offset=8
              local.get 2
              i32.const 0
              i32.store offset=24
              local.get 2
              local.get 0
              i32.store offset=12
              local.get 2
              local.get 3
              i32.store offset=8
              br 3 (;@2;)
            end
            local.get 8
            local.get 2
            i32.store
            local.get 2
            local.get 7
            i32.store offset=24
            local.get 2
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 2
            i32.store offset=8
            br 2 (;@2;)
          end
          local.get 3
          i32.const -8
          i32.and
          i32.const 1051512
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1051776
              local.tee 1
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 1
              local.get 3
              i32.or
              i32.store offset=1051776
              local.get 0
              local.set 3
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 3
          local.get 2
          i32.store offset=12
          local.get 2
          local.get 0
          i32.store offset=12
          local.get 2
          local.get 3
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 6
        local.get 3
        local.get 2
        i32.add
        local.tee 0
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 6
        local.get 0
        i32.add
        local.tee 0
        local.get 0
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
      end
      local.get 6
      i32.const 8
      i32.add
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  i32.const 0
                  i32.load offset=1051784
                  local.tee 0
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1051788
                    local.tee 0
                    local.get 2
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 0
                    local.get 2
                    i32.const 65583
                    i32.add
                    local.tee 6
                    i32.const 16
                    i32.shr_u
                    memory.grow
                    local.tee 3
                    i32.const -1
                    i32.eq
                    local.tee 7
                    br_if 7 (;@1;)
                    local.get 3
                    i32.const 16
                    i32.shl
                    local.tee 1
                    i32.eqz
                    br_if 7 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051800
                    i32.const 0
                    local.get 6
                    i32.const -65536
                    i32.and
                    local.get 7
                    select
                    local.tee 8
                    i32.add
                    local.tee 0
                    i32.store offset=1051800
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051804
                    local.tee 3
                    local.get 0
                    local.get 3
                    local.get 0
                    i32.gt_u
                    select
                    i32.store offset=1051804
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051796
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1051496
                          local.set 0
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 0
                            i32.load offset=4
                            local.tee 7
                            i32.add
                            local.get 1
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 3 (;@9;)
                          end
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1051812
                            local.tee 0
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 1
                            i32.le_u
                            br_if 1 (;@11;)
                          end
                          i32.const 0
                          local.get 1
                          i32.store offset=1051812
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1051816
                        i32.const 0
                        local.get 8
                        i32.store offset=1051500
                        i32.const 0
                        local.get 1
                        i32.store offset=1051496
                        i32.const 0
                        i32.const 1051512
                        i32.store offset=1051524
                        i32.const 0
                        i32.const 1051520
                        i32.store offset=1051532
                        i32.const 0
                        i32.const 1051512
                        i32.store offset=1051520
                        i32.const 0
                        i32.const 1051528
                        i32.store offset=1051540
                        i32.const 0
                        i32.const 1051520
                        i32.store offset=1051528
                        i32.const 0
                        i32.const 1051536
                        i32.store offset=1051548
                        i32.const 0
                        i32.const 1051528
                        i32.store offset=1051536
                        i32.const 0
                        i32.const 1051544
                        i32.store offset=1051556
                        i32.const 0
                        i32.const 1051536
                        i32.store offset=1051544
                        i32.const 0
                        i32.const 1051552
                        i32.store offset=1051564
                        i32.const 0
                        i32.const 1051544
                        i32.store offset=1051552
                        i32.const 0
                        i32.const 1051560
                        i32.store offset=1051572
                        i32.const 0
                        i32.const 1051552
                        i32.store offset=1051560
                        i32.const 0
                        i32.const 1051568
                        i32.store offset=1051580
                        i32.const 0
                        i32.const 1051560
                        i32.store offset=1051568
                        i32.const 0
                        i32.const 0
                        i32.store offset=1051508
                        i32.const 0
                        i32.const 1051576
                        i32.store offset=1051588
                        i32.const 0
                        i32.const 1051568
                        i32.store offset=1051576
                        i32.const 0
                        i32.const 1051576
                        i32.store offset=1051584
                        i32.const 0
                        i32.const 1051584
                        i32.store offset=1051596
                        i32.const 0
                        i32.const 1051584
                        i32.store offset=1051592
                        i32.const 0
                        i32.const 1051592
                        i32.store offset=1051604
                        i32.const 0
                        i32.const 1051592
                        i32.store offset=1051600
                        i32.const 0
                        i32.const 1051600
                        i32.store offset=1051612
                        i32.const 0
                        i32.const 1051600
                        i32.store offset=1051608
                        i32.const 0
                        i32.const 1051608
                        i32.store offset=1051620
                        i32.const 0
                        i32.const 1051608
                        i32.store offset=1051616
                        i32.const 0
                        i32.const 1051616
                        i32.store offset=1051628
                        i32.const 0
                        i32.const 1051616
                        i32.store offset=1051624
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051636
                        i32.const 0
                        i32.const 1051624
                        i32.store offset=1051632
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051644
                        i32.const 0
                        i32.const 1051632
                        i32.store offset=1051640
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051652
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051660
                        i32.const 0
                        i32.const 1051640
                        i32.store offset=1051648
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051668
                        i32.const 0
                        i32.const 1051648
                        i32.store offset=1051656
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051676
                        i32.const 0
                        i32.const 1051656
                        i32.store offset=1051664
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051684
                        i32.const 0
                        i32.const 1051664
                        i32.store offset=1051672
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051692
                        i32.const 0
                        i32.const 1051672
                        i32.store offset=1051680
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051700
                        i32.const 0
                        i32.const 1051680
                        i32.store offset=1051688
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051708
                        i32.const 0
                        i32.const 1051688
                        i32.store offset=1051696
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051716
                        i32.const 0
                        i32.const 1051696
                        i32.store offset=1051704
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051724
                        i32.const 0
                        i32.const 1051704
                        i32.store offset=1051712
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051732
                        i32.const 0
                        i32.const 1051712
                        i32.store offset=1051720
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051740
                        i32.const 0
                        i32.const 1051720
                        i32.store offset=1051728
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051748
                        i32.const 0
                        i32.const 1051728
                        i32.store offset=1051736
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051756
                        i32.const 0
                        i32.const 1051736
                        i32.store offset=1051744
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051764
                        i32.const 0
                        i32.const 1051744
                        i32.store offset=1051752
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051772
                        i32.const 0
                        i32.const 1051752
                        i32.store offset=1051760
                        i32.const 0
                        local.get 1
                        i32.store offset=1051796
                        i32.const 0
                        i32.const 1051760
                        i32.store offset=1051768
                        i32.const 0
                        local.get 8
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.store offset=1051788
                        local.get 1
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 0
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 0
                        i32.const 2097152
                        i32.store offset=1051808
                        br 8 (;@2;)
                      end
                      local.get 3
                      local.get 1
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 3
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.load offset=12
                      i32.eqz
                      br_if 3 (;@6;)
                    end
                    i32.const 0
                    i32.const 0
                    i32.load offset=1051812
                    local.tee 0
                    local.get 1
                    local.get 0
                    local.get 1
                    i32.lt_u
                    select
                    i32.store offset=1051812
                    local.get 1
                    local.get 8
                    i32.add
                    local.set 6
                    i32.const 1051496
                    local.set 0
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          loop  ;; label = @12
                            local.get 0
                            i32.load
                            local.get 6
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                            br 2 (;@10;)
                          end
                        end
                        local.get 0
                        i32.load offset=12
                        i32.eqz
                        br_if 1 (;@9;)
                      end
                      i32.const 1051496
                      local.set 0
                      block  ;; label = @10
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load
                            local.tee 6
                            local.get 3
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 3
                            local.get 6
                            local.get 0
                            i32.load offset=4
                            i32.add
                            local.tee 6
                            i32.lt_u
                            br_if 2 (;@10;)
                          end
                          local.get 0
                          i32.load offset=8
                          local.set 0
                          br 0 (;@11;)
                        end
                      end
                      i32.const 0
                      local.get 1
                      i32.store offset=1051796
                      i32.const 0
                      local.get 8
                      i32.const -40
                      i32.add
                      local.tee 0
                      i32.store offset=1051788
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 0
                      i32.const 2097152
                      i32.store offset=1051808
                      local.get 3
                      local.get 6
                      i32.const -32
                      i32.add
                      i32.const -8
                      i32.and
                      i32.const -8
                      i32.add
                      local.tee 0
                      local.get 0
                      local.get 3
                      i32.const 16
                      i32.add
                      i32.lt_u
                      select
                      local.tee 7
                      i32.const 27
                      i32.store offset=4
                      i32.const 0
                      i64.load offset=1051496 align=4
                      local.set 9
                      local.get 7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1051504 align=4
                      i64.store align=4
                      local.get 7
                      local.get 9
                      i64.store offset=8 align=4
                      i32.const 0
                      local.get 8
                      i32.store offset=1051500
                      i32.const 0
                      local.get 1
                      i32.store offset=1051496
                      i32.const 0
                      local.get 7
                      i32.const 8
                      i32.add
                      i32.store offset=1051504
                      i32.const 0
                      i32.const 0
                      i32.store offset=1051508
                      local.get 7
                      i32.const 28
                      i32.add
                      local.set 0
                      loop  ;; label = @10
                        local.get 0
                        i32.const 7
                        i32.store
                        local.get 0
                        i32.const 4
                        i32.add
                        local.tee 0
                        local.get 6
                        i32.lt_u
                        br_if 0 (;@10;)
                      end
                      local.get 7
                      local.get 3
                      i32.eq
                      br_if 7 (;@2;)
                      local.get 7
                      local.get 7
                      i32.load offset=4
                      i32.const -2
                      i32.and
                      i32.store offset=4
                      local.get 3
                      local.get 7
                      local.get 3
                      i32.sub
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 0
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.const 256
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 3
                        local.get 0
                        call 52
                        br 8 (;@2;)
                      end
                      local.get 0
                      i32.const -8
                      i32.and
                      i32.const 1051512
                      i32.add
                      local.set 6
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1051776
                          local.tee 1
                          i32.const 1
                          local.get 0
                          i32.const 3
                          i32.shr_u
                          i32.shl
                          local.tee 0
                          i32.and
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 1
                          local.get 0
                          i32.or
                          i32.store offset=1051776
                          local.get 6
                          local.set 0
                          br 1 (;@10;)
                        end
                        local.get 6
                        i32.load offset=8
                        local.set 0
                      end
                      local.get 6
                      local.get 3
                      i32.store offset=8
                      local.get 0
                      local.get 3
                      i32.store offset=12
                      local.get 3
                      local.get 6
                      i32.store offset=12
                      local.get 3
                      local.get 0
                      i32.store offset=8
                      br 7 (;@2;)
                    end
                    local.get 0
                    local.get 1
                    i32.store
                    local.get 0
                    local.get 0
                    i32.load offset=4
                    local.get 8
                    i32.add
                    i32.store offset=4
                    local.get 1
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 6
                    local.get 1
                    local.get 2
                    i32.add
                    local.tee 0
                    i32.sub
                    local.set 3
                    local.get 6
                    i32.const 0
                    i32.load offset=1051796
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 6
                    i32.const 0
                    i32.load offset=1051792
                    i32.eq
                    br_if 4 (;@4;)
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=4
                      local.tee 2
                      i32.const 3
                      i32.and
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 6
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call 18
                      local.get 2
                      local.get 3
                      i32.add
                      local.set 3
                      local.get 6
                      local.get 2
                      i32.add
                      local.tee 6
                      i32.load offset=4
                      local.set 2
                    end
                    local.get 6
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    local.get 3
                    i32.store
                    block  ;; label = @9
                      local.get 3
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 3
                      call 52
                      br 6 (;@3;)
                    end
                    local.get 3
                    i32.const -8
                    i32.and
                    i32.const 1051512
                    i32.add
                    local.set 2
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1051776
                        local.tee 6
                        i32.const 1
                        local.get 3
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 3
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 6
                        local.get 3
                        i32.or
                        i32.store offset=1051776
                        local.get 2
                        local.set 3
                        br 1 (;@9;)
                      end
                      local.get 2
                      i32.load offset=8
                      local.set 3
                    end
                    local.get 2
                    local.get 0
                    i32.store offset=8
                    local.get 3
                    local.get 0
                    i32.store offset=12
                    local.get 0
                    local.get 2
                    i32.store offset=12
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    br 5 (;@3;)
                  end
                  i32.const 0
                  local.get 0
                  local.get 2
                  i32.sub
                  local.tee 3
                  i32.store offset=1051788
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051796
                  local.tee 0
                  local.get 2
                  i32.add
                  local.tee 6
                  i32.store offset=1051796
                  local.get 6
                  local.get 3
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 0
                  br 6 (;@1;)
                end
                i32.const 0
                i32.load offset=1051792
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    local.get 2
                    i32.sub
                    local.tee 6
                    i32.const 15
                    i32.gt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051792
                    i32.const 0
                    i32.const 0
                    i32.store offset=1051784
                    local.get 3
                    local.get 0
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 3
                    local.get 0
                    i32.add
                    local.tee 0
                    local.get 0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.get 6
                  i32.store offset=1051784
                  i32.const 0
                  local.get 3
                  local.get 2
                  i32.add
                  local.tee 1
                  i32.store offset=1051792
                  local.get 1
                  local.get 6
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 3
                  local.get 0
                  i32.add
                  local.get 6
                  i32.store
                  local.get 3
                  local.get 2
                  i32.const 3
                  i32.or
                  i32.store offset=4
                end
                local.get 3
                i32.const 8
                i32.add
                return
              end
              local.get 0
              local.get 7
              local.get 8
              i32.add
              i32.store offset=4
              i32.const 0
              i32.const 0
              i32.load offset=1051796
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 3
              i32.const -8
              i32.add
              local.tee 6
              i32.store offset=1051796
              i32.const 0
              local.get 0
              local.get 3
              i32.sub
              i32.const 0
              i32.load offset=1051788
              local.get 8
              i32.add
              local.tee 3
              i32.add
              i32.const 8
              i32.add
              local.tee 1
              i32.store offset=1051788
              local.get 6
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              i32.const 40
              i32.store offset=4
              i32.const 0
              i32.const 2097152
              i32.store offset=1051808
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1051796
            i32.const 0
            i32.const 0
            i32.load offset=1051788
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1051788
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1051792
          i32.const 0
          i32.const 0
          i32.load offset=1051784
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1051784
          local.get 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
        end
        local.get 1
        i32.const 8
        i32.add
        return
      end
      i32.const 0
      local.set 0
      i32.const 0
      i32.load offset=1051788
      local.tee 3
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 3
      local.get 2
      i32.sub
      local.tee 3
      i32.store offset=1051788
      i32.const 0
      i32.const 0
      i32.load offset=1051796
      local.tee 0
      local.get 2
      i32.add
      local.tee 6
      i32.store offset=1051796
      local.get 6
      local.get 3
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.const 3
      i32.or
      i32.store offset=4
      local.get 0
      i32.const 8
      i32.add
      return
    end
    local.get 0)
  (func (;21;) (type 6) (param i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    i32.add
    local.tee 1
    local.get 0
    i32.const -4
    i32.add
    i32.load
    local.tee 2
    i32.const -8
    i32.and
    local.tee 0
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 2
        local.get 0
        i32.add
        local.set 0
        block  ;; label = @3
          local.get 1
          local.get 2
          i32.sub
          local.tee 1
          i32.const 0
          i32.load offset=1051792
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 0
          i32.store offset=1051784
          local.get 3
          local.get 3
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 0
          i32.store
          return
        end
        local.get 1
        local.get 2
        call 18
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.load offset=4
                      local.tee 2
                      i32.const 2
                      i32.and
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1051796
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1051792
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 3
                      local.get 2
                      i32.const -8
                      i32.and
                      local.tee 2
                      call 18
                      local.get 1
                      local.get 2
                      local.get 0
                      i32.add
                      local.tee 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 0
                      i32.add
                      local.get 0
                      i32.store
                      local.get 1
                      i32.const 0
                      i32.load offset=1051792
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 0
                      local.get 0
                      i32.store offset=1051784
                      return
                    end
                    local.get 3
                    local.get 2
                    i32.const -2
                    i32.and
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 0
                    i32.add
                    local.get 0
                    i32.store
                  end
                  local.get 0
                  i32.const 256
                  i32.lt_u
                  br_if 2 (;@5;)
                  i32.const 31
                  local.set 3
                  block  ;; label = @8
                    local.get 0
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 6
                    local.get 0
                    i32.const 8
                    i32.shr_u
                    i32.clz
                    local.tee 3
                    i32.sub
                    i32.shr_u
                    i32.const 1
                    i32.and
                    local.get 3
                    i32.const 1
                    i32.shl
                    i32.sub
                    i32.const 62
                    i32.add
                    local.set 3
                  end
                  local.get 1
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 1
                  local.get 3
                  i32.store offset=28
                  local.get 3
                  i32.const 2
                  i32.shl
                  i32.const 1051368
                  i32.add
                  local.set 2
                  i32.const 0
                  i32.load offset=1051780
                  i32.const 1
                  local.get 3
                  i32.shl
                  local.tee 4
                  i32.and
                  br_if 3 (;@4;)
                  local.get 2
                  local.get 1
                  i32.store
                  local.get 1
                  local.get 2
                  i32.store offset=24
                  local.get 1
                  local.get 1
                  i32.store offset=12
                  local.get 1
                  local.get 1
                  i32.store offset=8
                  i32.const 0
                  i32.const 0
                  i32.load offset=1051780
                  local.get 4
                  i32.or
                  i32.store offset=1051780
                  br 4 (;@3;)
                end
                i32.const 0
                local.get 1
                i32.store offset=1051796
                i32.const 0
                i32.const 0
                i32.load offset=1051788
                local.get 0
                i32.add
                local.tee 0
                i32.store offset=1051788
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=1051792
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051784
                  i32.const 0
                  i32.const 0
                  i32.store offset=1051792
                end
                local.get 0
                i32.const 0
                i32.load offset=1051808
                local.tee 4
                i32.le_u
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1051796
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                i32.const 0
                local.set 2
                i32.const 0
                i32.load offset=1051788
                local.tee 5
                i32.const 41
                i32.lt_u
                br_if 4 (;@2;)
                i32.const 1051496
                local.set 1
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    local.tee 3
                    local.get 0
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 3
                    local.get 1
                    i32.load offset=4
                    i32.add
                    i32.lt_u
                    br_if 6 (;@2;)
                  end
                  local.get 1
                  i32.load offset=8
                  local.set 1
                  br 0 (;@7;)
                end
              end
              i32.const 0
              local.get 1
              i32.store offset=1051792
              i32.const 0
              i32.const 0
              i32.load offset=1051784
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=1051784
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              return
            end
            local.get 0
            i32.const -8
            i32.and
            i32.const 1051512
            i32.add
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1051776
                local.tee 2
                i32.const 1
                local.get 0
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 0
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 2
                local.get 0
                i32.or
                i32.store offset=1051776
                local.get 3
                local.set 0
                br 1 (;@5;)
              end
              local.get 3
              i32.load offset=8
              local.set 0
            end
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            return
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.load
                local.tee 4
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.ne
                br_if 0 (;@6;)
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 0
              i32.const 0
              i32.const 25
              local.get 3
              i32.const 1
              i32.shr_u
              i32.sub
              local.get 3
              i32.const 31
              i32.eq
              select
              i32.shl
              local.set 2
              loop  ;; label = @6
                local.get 4
                local.get 2
                i32.const 29
                i32.shr_u
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 5
                i32.load
                local.tee 3
                i32.eqz
                br_if 2 (;@4;)
                local.get 2
                i32.const 1
                i32.shl
                local.set 2
                local.get 3
                local.set 4
                local.get 3
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 0
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 3
            i32.load offset=8
            local.tee 0
            local.get 1
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=8
            local.get 1
            i32.const 0
            i32.store offset=24
            local.get 1
            local.get 3
            i32.store offset=12
            local.get 1
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
        end
        i32.const 0
        local.set 1
        i32.const 0
        i32.const 0
        i32.load offset=1051816
        i32.const -1
        i32.add
        local.tee 0
        i32.store offset=1051816
        local.get 0
        br_if 1 (;@1;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1051504
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          loop  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 0
            i32.load offset=8
            local.tee 0
            br_if 0 (;@4;)
          end
        end
        i32.const 0
        local.get 1
        i32.const 4095
        local.get 1
        i32.const 4095
        i32.gt_u
        select
        i32.store offset=1051816
        return
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1051504
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          local.get 1
          i32.load offset=8
          local.tee 1
          br_if 0 (;@3;)
        end
      end
      i32.const 0
      local.get 2
      i32.const 4095
      local.get 2
      i32.const 4095
      i32.gt_u
      select
      i32.store offset=1051816
      local.get 5
      local.get 4
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1051808
    end)
  (func (;22;) (type 4) (param i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 0
    i32.store offset=16
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 4
    i64.store offset=8 align=4
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call 25
    unreachable)
  (func (;23;) (type 2) (param i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      call 24
      unreachable
    end
    unreachable
    unreachable)
  (func (;24;) (type 3)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1049084
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1049120
    call 25
    unreachable)
  (func (;25;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i64.load align=4
    i64.store
    local.get 2
    call 35
    unreachable)
  (func (;26;) (type 4) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call 23
      unreachable
    end
    i32.const 1
    local.set 4
    local.get 0
    i32.load
    local.tee 5
    i32.const 1
    i32.shl
    local.tee 1
    local.get 2
    local.get 1
    local.get 2
    i32.gt_u
    select
    local.tee 1
    i32.const 8
    local.get 1
    i32.const 8
    i32.gt_u
    select
    local.tee 1
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 5
      i32.store offset=28
      local.get 3
      local.get 0
      i32.load offset=4
      i32.store offset=20
    end
    local.get 3
    local.get 4
    i32.store offset=24
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 1
    local.get 3
    i32.const 20
    i32.add
    call 27
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=16
      call 23
      unreachable
    end
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func (;27;) (type 10) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.load offset=4
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 3
              i32.load offset=8
              local.tee 4
              br_if 0 (;@5;)
              i32.const 0
              i32.load8_u offset=1051852
              drop
              br 2 (;@3;)
            end
            local.get 3
            i32.load
            local.get 4
            local.get 2
            call 17
            local.set 4
            br 2 (;@2;)
          end
          i32.const 0
          i32.load8_u offset=1051852
          drop
        end
        local.get 2
        call 20
        local.set 4
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func (;28;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1049032
    i32.const 5
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 0))
  (func (;29;) (type 6) (param i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=4
          local.tee 2
          i32.const -4
          i32.add
          i32.load
          local.tee 0
          i32.const -8
          i32.and
          local.tee 3
          i32.const 4
          i32.const 8
          local.get 0
          i32.const 3
          i32.and
          local.tee 0
          select
          local.get 1
          i32.add
          i32.lt_u
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 1
            i32.const 39
            i32.add
            i32.gt_u
            br_if 3 (;@1;)
          end
          local.get 2
          call 21
        end
        return
      end
      i32.const 1050309
      i32.const 46
      i32.const 1050356
      call 22
      unreachable
    end
    i32.const 1050372
    i32.const 46
    i32.const 1050420
    call 22
    unreachable)
  (func (;30;) (type 0) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call 26
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call 71
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func (;31;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            call 32
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call 26
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call 71
      drop
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    i32.const 0)
  (func (;32;) (type 6) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call 23
      unreachable
    end
    i32.const 1
    local.set 3
    local.get 2
    i32.const 1
    i32.shl
    local.tee 4
    local.get 2
    i32.const 1
    i32.add
    local.tee 5
    local.get 4
    local.get 5
    i32.gt_u
    select
    local.tee 4
    i32.const 8
    local.get 4
    i32.const 8
    i32.gt_u
    select
    local.tee 4
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      local.get 0
      i32.load offset=4
      i32.store offset=20
    end
    local.get 1
    local.get 3
    i32.store offset=24
    local.get 1
    i32.const 8
    i32.add
    local.get 5
    local.get 4
    local.get 1
    i32.const 20
    i32.add
    call 27
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=16
      call 23
      unreachable
    end
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 4
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 32
    i32.add
    global.set 0)
  (func (;33;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049040
    local.get 1
    call 34)
  (func (;34;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 1
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.set 1
              local.get 0
              i32.const 3
              i32.shl
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 0)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.load offset=4
                call_indirect (type 1)
                br_if 3 (;@3;)
                local.get 1
                i32.const 8
                i32.add
                local.set 1
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 0)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 6
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 7
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load offset=4
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 7
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.load offset=4
              call_indirect (type 1)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 6
              i32.const 32
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 0)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set 0
    local.get 1)
  (func (;35;) (type 6) (param i32)
    (local i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load offset=24
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 1
    local.get 0
    i32.store offset=28
    local.get 1
    local.get 2
    i32.store offset=24
    local.get 1
    local.get 0
    i64.load align=4
    i64.store
    local.get 1
    call 53
    unreachable)
  (func (;36;) (type 6) (param i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store
    local.get 1
    i32.const 128
    i32.store offset=4
    local.get 1
    i32.const 2
    i32.store offset=12
    local.get 1
    i32.const 1049912
    i32.store offset=8
    local.get 1
    i64.const 2
    i64.store offset=20 align=4
    local.get 1
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 2
    local.get 1
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 1
    local.get 2
    local.get 1
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    i32.const 1049632
    call 25
    unreachable)
  (func (;37;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    local.get 1
    call 38)
  (func (;38;) (type 11) (param i64 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    i32.const 39
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 4
        br 1 (;@1;)
      end
      i32.const 39
      local.set 3
      loop  ;; label = @2
        local.get 2
        i32.const 9
        i32.add
        local.get 3
        i32.add
        local.tee 5
        i32.const -4
        i32.add
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 4
        i64.const 55536
        i64.mul
        local.get 0
        i64.add
        i32.wrap_i64
        local.tee 6
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 7
        i32.const 1
        i32.shl
        i32.const 1049650
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 5
        i32.const -2
        i32.add
        local.get 7
        i32.const -100
        i32.mul
        local.get 6
        i32.add
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1049650
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 3
        i32.const -4
        i32.add
        local.set 3
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 5
        local.get 4
        local.set 0
        local.get 5
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 4
      i32.wrap_i64
      local.tee 5
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 9
      i32.add
      local.get 3
      i32.const -2
      i32.add
      local.tee 3
      i32.add
      local.get 4
      i32.wrap_i64
      local.tee 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 5
      i32.const -100
      i32.mul
      local.get 6
      i32.add
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1049650
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 9
        i32.add
        local.get 3
        i32.const -2
        i32.add
        local.tee 3
        i32.add
        local.get 5
        i32.const 1
        i32.shl
        i32.const 1049650
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 2
      i32.const 9
      i32.add
      local.get 3
      i32.const -1
      i32.add
      local.tee 3
      i32.add
      local.get 5
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 1
    i32.const 1
    i32.const 0
    local.get 2
    i32.const 9
    i32.add
    local.get 3
    i32.add
    i32.const 39
    local.get 3
    i32.sub
    call 39
    local.set 3
    local.get 2
    i32.const 48
    i32.add
    global.set 0
    local.get 3)
  (func (;39;) (type 5) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=28
    local.tee 5
    i32.const 1
    i32.and
    local.tee 6
    local.get 4
    i32.add
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          i32.const 3
          i32.and
          local.tee 9
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        i32.const 0
        local.set 8
        local.get 1
        local.set 10
        loop  ;; label = @3
          local.get 8
          local.get 10
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 10
          i32.const 1
          i32.add
          local.set 10
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 8
      local.get 7
      i32.add
      local.set 7
    end
    i32.const 43
    i32.const 1114112
    local.get 6
    select
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 10
        local.get 0
        i32.load offset=20
        local.tee 8
        local.get 0
        i32.load offset=24
        local.tee 9
        local.get 6
        local.get 1
        local.get 2
        call 40
        br_if 1 (;@1;)
        local.get 8
        local.get 3
        local.get 4
        local.get 9
        i32.load offset=12
        call_indirect (type 0)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 11
        local.get 7
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 10
        local.get 0
        i32.load offset=20
        local.tee 8
        local.get 0
        i32.load offset=24
        local.tee 9
        local.get 6
        local.get 1
        local.get 2
        call 40
        br_if 1 (;@1;)
        local.get 8
        local.get 3
        local.get 4
        local.get 9
        i32.load offset=12
        call_indirect (type 0)
        return
      end
      block  ;; label = @2
        local.get 5
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 5
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 12
        i32.const 1
        local.set 10
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 8
        local.get 0
        i32.load offset=24
        local.tee 9
        local.get 6
        local.get 1
        local.get 2
        call 40
        br_if 1 (;@1;)
        local.get 11
        local.get 7
        i32.sub
        i32.const 1
        i32.add
        local.set 10
        block  ;; label = @3
          loop  ;; label = @4
            local.get 10
            i32.const -1
            i32.add
            local.tee 10
            i32.eqz
            br_if 1 (;@3;)
            local.get 8
            i32.const 48
            local.get 9
            i32.load offset=16
            call_indirect (type 1)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 10
        local.get 8
        local.get 3
        local.get 4
        local.get 9
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 0
        local.get 12
        i32.store8 offset=32
        local.get 0
        local.get 5
        i32.store offset=16
        i32.const 0
        local.set 10
        br 1 (;@1;)
      end
      local.get 11
      local.get 7
      i32.sub
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 10
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 5
          local.set 10
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        local.get 5
        i32.const 1
        i32.shr_u
        local.set 10
        local.get 5
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 5
      end
      local.get 10
      i32.const 1
      i32.add
      local.set 10
      local.get 0
      i32.load offset=16
      local.set 7
      local.get 0
      i32.load offset=24
      local.set 8
      local.get 0
      i32.load offset=20
      local.set 9
      block  ;; label = @2
        loop  ;; label = @3
          local.get 10
          i32.const -1
          i32.add
          local.tee 10
          i32.eqz
          br_if 1 (;@2;)
          local.get 9
          local.get 7
          local.get 8
          i32.load offset=16
          call_indirect (type 1)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 10
      local.get 9
      local.get 8
      local.get 6
      local.get 1
      local.get 2
      call 40
      br_if 0 (;@1;)
      local.get 9
      local.get 3
      local.get 4
      local.get 8
      i32.load offset=12
      call_indirect (type 0)
      br_if 0 (;@1;)
      i32.const 0
      local.set 10
      loop  ;; label = @2
        block  ;; label = @3
          local.get 5
          local.get 10
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          local.get 5
          i32.lt_u
          return
        end
        local.get 10
        i32.const 1
        i32.add
        local.set 10
        local.get 9
        local.get 7
        local.get 8
        i32.load offset=16
        call_indirect (type 1)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 10
      i32.const -1
      i32.add
      local.get 5
      i32.lt_u
      return
    end
    local.get 10)
  (func (;40;) (type 5) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 1)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 0))
  (func (;41;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load
          local.tee 3
          local.get 0
          i32.load offset=8
          local.tee 4
          i32.or
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 2
            i32.add
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=12
                local.tee 6
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                local.get 1
                local.set 8
                br 1 (;@5;)
              end
              i32.const 0
              local.set 7
              i32.const 0
              local.set 9
              local.get 1
              local.set 8
              loop  ;; label = @6
                local.get 8
                local.tee 4
                local.get 5
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load8_s
                    local.tee 8
                    i32.const -1
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.const -32
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 2
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 8
                    i32.const -16
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 4
                    i32.const 3
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 4
                  i32.add
                  local.set 8
                end
                local.get 8
                local.get 4
                i32.sub
                local.get 7
                i32.add
                local.set 7
                local.get 6
                local.get 9
                i32.const 1
                i32.add
                local.tee 9
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 8
            local.get 5
            i32.eq
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 8
              i32.load8_s
              local.tee 4
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 4
              i32.const -32
              i32.lt_u
              drop
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 7
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 7
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 4
                  local.get 1
                  local.get 7
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 0
                local.set 4
                local.get 7
                local.get 2
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 1
              local.set 4
            end
            local.get 7
            local.get 2
            local.get 4
            select
            local.set 2
            local.get 4
            local.get 1
            local.get 4
            select
            local.set 1
          end
          block  ;; label = @4
            local.get 3
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=20
            local.get 1
            local.get 2
            local.get 0
            i32.load offset=24
            i32.load offset=12
            call_indirect (type 0)
            return
          end
          local.get 0
          i32.load offset=4
          local.set 10
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 1
            local.get 1
            i32.const 3
            i32.add
            i32.const -4
            i32.and
            local.tee 7
            i32.sub
            local.tee 9
            i32.add
            local.tee 11
            i32.const 3
            i32.and
            local.set 3
            i32.const 0
            local.set 6
            i32.const 0
            local.set 4
            block  ;; label = @5
              local.get 1
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              local.set 4
              block  ;; label = @6
                local.get 9
                i32.const -4
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                local.set 4
                i32.const 0
                local.set 5
                loop  ;; label = @7
                  local.get 4
                  local.get 1
                  local.get 5
                  i32.add
                  local.tee 8
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 1
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 2
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.get 8
                  i32.const 3
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  i32.add
                  local.set 4
                  local.get 5
                  i32.const 4
                  i32.add
                  local.tee 5
                  br_if 0 (;@7;)
                end
              end
              local.get 1
              local.set 8
              loop  ;; label = @6
                local.get 4
                local.get 8
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set 4
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 9
                i32.const 1
                i32.add
                local.tee 9
                br_if 0 (;@6;)
              end
            end
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              local.get 11
              i32.const -4
              i32.and
              i32.add
              local.tee 8
              i32.load8_s
              i32.const -65
              i32.gt_s
              local.set 6
              local.get 3
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              local.get 8
              i32.load8_s offset=1
              i32.const -65
              i32.gt_s
              i32.add
              local.set 6
              local.get 3
              i32.const 2
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              local.get 8
              i32.load8_s offset=2
              i32.const -65
              i32.gt_s
              i32.add
              local.set 6
            end
            local.get 11
            i32.const 2
            i32.shr_u
            local.set 5
            local.get 6
            local.get 4
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 7
              local.set 3
              local.get 5
              i32.eqz
              br_if 4 (;@1;)
              local.get 5
              i32.const 192
              local.get 5
              i32.const 192
              i32.lt_u
              select
              local.tee 11
              i32.const 3
              i32.and
              local.set 12
              local.get 11
              i32.const 2
              i32.shl
              local.set 13
              i32.const 0
              local.set 8
              block  ;; label = @6
                local.get 5
                i32.const 4
                i32.lt_u
                br_if 0 (;@6;)
                local.get 3
                local.get 13
                i32.const 1008
                i32.and
                i32.add
                local.set 9
                i32.const 0
                local.set 8
                local.get 3
                local.set 4
                loop  ;; label = @7
                  local.get 4
                  i32.load offset=12
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load offset=8
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load offset=4
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 4
                  i32.load
                  local.tee 7
                  i32.const -1
                  i32.xor
                  i32.const 7
                  i32.shr_u
                  local.get 7
                  i32.const 6
                  i32.shr_u
                  i32.or
                  i32.const 16843009
                  i32.and
                  local.get 8
                  i32.add
                  i32.add
                  i32.add
                  i32.add
                  local.set 8
                  local.get 4
                  i32.const 16
                  i32.add
                  local.tee 4
                  local.get 9
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 5
              local.get 11
              i32.sub
              local.set 5
              local.get 3
              local.get 13
              i32.add
              local.set 7
              local.get 8
              i32.const 8
              i32.shr_u
              i32.const 16711935
              i32.and
              local.get 8
              i32.const 16711935
              i32.and
              i32.add
              i32.const 65537
              i32.mul
              i32.const 16
              i32.shr_u
              local.get 6
              i32.add
              local.set 6
              local.get 12
              i32.eqz
              br_if 0 (;@5;)
            end
            local.get 3
            local.get 11
            i32.const 252
            i32.and
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            i32.load
            local.tee 4
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 4
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.set 4
            local.get 12
            i32.const 1
            i32.eq
            br_if 2 (;@2;)
            local.get 8
            i32.load offset=4
            local.tee 7
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 7
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 4
            i32.add
            local.set 4
            local.get 12
            i32.const 2
            i32.eq
            br_if 2 (;@2;)
            local.get 8
            i32.load offset=8
            local.tee 8
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 8
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.get 4
            i32.add
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            br 3 (;@1;)
          end
          local.get 2
          i32.const 3
          i32.and
          local.set 8
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 4
              i32.ge_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 6
              i32.const 0
              local.set 4
              br 1 (;@4;)
            end
            local.get 1
            i32.load8_s
            i32.const -65
            i32.gt_s
            local.get 1
            i32.load8_s offset=1
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=2
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=3
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 2
            i32.const 12
            i32.and
            local.tee 4
            i32.const 4
            i32.eq
            br_if 0 (;@4;)
            local.get 6
            local.get 1
            i32.load8_s offset=4
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=5
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=6
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=7
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 4
            i32.const 8
            i32.eq
            br_if 0 (;@4;)
            local.get 6
            local.get 1
            i32.load8_s offset=8
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=9
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=10
            i32.const -65
            i32.gt_s
            i32.add
            local.get 1
            i32.load8_s offset=11
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
          end
          local.get 8
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          local.get 4
          i32.add
          local.set 4
          loop  ;; label = @4
            local.get 6
            local.get 4
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 8
            i32.const -1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        return
      end
      local.get 4
      i32.const 8
      i32.shr_u
      i32.const 459007
      i32.and
      local.get 4
      i32.const 16711935
      i32.and
      i32.add
      i32.const 65537
      i32.mul
      i32.const 16
      i32.shr_u
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 10
        local.get 6
        i32.le_u
        br_if 0 (;@2;)
        local.get 10
        local.get 6
        i32.sub
        local.set 5
        i32.const 0
        local.set 4
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load8_u offset=32
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
            end
            local.get 5
            local.set 4
            i32.const 0
            local.set 5
            br 1 (;@3;)
          end
          local.get 5
          i32.const 1
          i32.shr_u
          local.set 4
          local.get 5
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set 5
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 0
        i32.load offset=16
        local.set 9
        local.get 0
        i32.load offset=24
        local.set 8
        local.get 0
        i32.load offset=20
        local.set 7
        loop  ;; label = @3
          local.get 4
          i32.const -1
          i32.add
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
          local.get 7
          local.get 9
          local.get 8
          i32.load offset=16
          call_indirect (type 1)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      local.get 0
      i32.load offset=20
      local.get 1
      local.get 2
      local.get 0
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 0)
      return
    end
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 7
      local.get 1
      local.get 2
      local.get 8
      i32.load offset=12
      call_indirect (type 0)
      br_if 0 (;@1;)
      i32.const 0
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 5
            local.get 4
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            local.set 4
            br 2 (;@2;)
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 7
          local.get 9
          local.get 8
          i32.load offset=16
          call_indirect (type 1)
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 4
        i32.const -1
        i32.add
        local.set 4
      end
      local.get 4
      local.get 5
      i32.lt_u
      local.set 4
    end
    local.get 4)
  (func (;42;) (type 4) (param i32 i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 3
    global.set 0
    local.get 3
    i32.const 1050860
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 1050860
    i32.store offset=20
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    i32.const 2
    i32.store offset=28
    local.get 3
    i32.const 1049404
    i32.store offset=24
    block  ;; label = @1
      local.get 2
      i32.load
      br_if 0 (;@1;)
      local.get 3
      i32.const 3
      i32.store offset=92
      local.get 3
      i32.const 1049456
      i32.store offset=88
      local.get 3
      i64.const 3
      i64.store offset=100 align=4
      local.get 3
      i32.const 4
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 4
      local.get 3
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=72
      local.get 3
      local.get 4
      local.get 3
      i32.const 8
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get 3
      i32.const 5
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 3
      i32.const 24
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 3
      local.get 3
      i32.const 56
      i32.add
      i32.store offset=96
      local.get 3
      i32.const 88
      i32.add
      i32.const 1050744
      call 25
      unreachable
    end
    local.get 3
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 3
    local.get 2
    i64.load align=4
    i64.store offset=32
    local.get 3
    i32.const 4
    i32.store offset=92
    local.get 3
    i32.const 1049508
    i32.store offset=88
    local.get 3
    i64.const 4
    i64.store offset=100 align=4
    local.get 3
    i32.const 4
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=80
    local.get 3
    local.get 4
    local.get 3
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=72
    local.get 3
    i32.const 6
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i32.const 32
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get 3
    i32.const 5
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 3
    i32.const 24
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 3
    local.get 3
    i32.const 56
    i32.add
    i32.store offset=96
    local.get 3
    i32.const 88
    i32.add
    i32.const 1050744
    call 25
    unreachable)
  (func (;43;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 1))
  (func (;44;) (type 1) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call 41)
  (func (;45;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    local.get 1
    i32.load offset=24
    local.get 0
    call 34)
  (func (;46;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    i32.const -1
    i32.add
    local.set 3
    local.get 0
    i32.load offset=4
    local.set 4
    local.get 0
    i32.load
    local.set 5
    local.get 0
    i32.load offset=8
    local.set 6
    i32.const 0
    local.set 7
    i32.const 0
    local.set 8
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          local.get 2
          i32.gt_u
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 1
            local.get 7
            i32.add
            local.set 9
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    local.get 7
                    i32.sub
                    local.tee 10
                    i32.const 7
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 2
                    local.get 7
                    i32.ne
                    br_if 1 (;@7;)
                    local.get 2
                    local.set 7
                    br 5 (;@3;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 9
                      i32.const 3
                      i32.add
                      i32.const -4
                      i32.and
                      local.tee 11
                      local.get 9
                      i32.sub
                      local.tee 12
                      i32.eqz
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 0
                      loop  ;; label = @10
                        local.get 9
                        local.get 0
                        i32.add
                        i32.load8_u
                        i32.const 10
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 12
                        local.get 0
                        i32.const 1
                        i32.add
                        local.tee 0
                        i32.ne
                        br_if 0 (;@10;)
                      end
                      local.get 12
                      local.get 10
                      i32.const -8
                      i32.add
                      local.tee 13
                      i32.le_u
                      br_if 1 (;@8;)
                      br 3 (;@6;)
                    end
                    local.get 10
                    i32.const -8
                    i32.add
                    local.set 13
                  end
                  loop  ;; label = @8
                    local.get 11
                    i32.const 4
                    i32.add
                    i32.load
                    local.tee 0
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.and
                    local.get 11
                    i32.load
                    local.tee 0
                    i32.const 168430090
                    i32.xor
                    i32.const -16843009
                    i32.add
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.or
                    i32.const -2139062144
                    i32.and
                    br_if 2 (;@6;)
                    local.get 11
                    i32.const 8
                    i32.add
                    local.set 11
                    local.get 12
                    i32.const 8
                    i32.add
                    local.tee 12
                    local.get 13
                    i32.le_u
                    br_if 0 (;@8;)
                    br 2 (;@6;)
                  end
                end
                i32.const 0
                local.set 0
                loop  ;; label = @7
                  local.get 9
                  local.get 0
                  i32.add
                  i32.load8_u
                  i32.const 10
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 10
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 7
                br 3 (;@3;)
              end
              block  ;; label = @6
                local.get 12
                local.get 10
                i32.ne
                br_if 0 (;@6;)
                local.get 2
                local.set 7
                br 3 (;@3;)
              end
              local.get 9
              local.get 12
              i32.add
              local.set 11
              local.get 2
              local.get 12
              i32.sub
              local.get 7
              i32.sub
              local.set 10
              i32.const 0
              local.set 0
              block  ;; label = @6
                loop  ;; label = @7
                  local.get 11
                  local.get 0
                  i32.add
                  i32.load8_u
                  i32.const 10
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 10
                  local.get 0
                  i32.const 1
                  i32.add
                  local.tee 0
                  i32.ne
                  br_if 0 (;@7;)
                end
                local.get 2
                local.set 7
                br 3 (;@3;)
              end
              local.get 0
              local.get 12
              i32.add
              local.set 0
            end
            local.get 0
            local.get 7
            i32.add
            local.tee 11
            i32.const 1
            i32.add
            local.set 7
            block  ;; label = @5
              local.get 11
              local.get 2
              i32.ge_u
              br_if 0 (;@5;)
              local.get 9
              local.get 0
              i32.add
              i32.load8_u
              i32.const 10
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              local.get 7
              local.set 12
              local.get 7
              local.set 0
              br 3 (;@2;)
            end
            local.get 7
            local.get 2
            i32.le_u
            br_if 0 (;@4;)
          end
        end
        i32.const 1
        local.set 9
        local.get 8
        local.set 12
        local.get 2
        local.set 0
        local.get 8
        local.get 2
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      block  ;; label = @2
        local.get 6
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        i32.const 1049584
        i32.const 4
        local.get 4
        i32.load offset=12
        call_indirect (type 0)
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1
        return
      end
      local.get 0
      local.get 8
      i32.sub
      local.set 10
      i32.const 0
      local.set 11
      block  ;; label = @2
        local.get 0
        local.get 8
        i32.eq
        br_if 0 (;@2;)
        local.get 3
        local.get 0
        i32.add
        i32.load8_u
        i32.const 10
        i32.eq
        local.set 11
      end
      local.get 1
      local.get 8
      i32.add
      local.set 0
      local.get 6
      local.get 11
      i32.store8
      local.get 12
      local.set 8
      local.get 5
      local.get 0
      local.get 10
      local.get 4
      i32.load offset=12
      call_indirect (type 0)
      local.tee 0
      local.get 9
      i32.or
      i32.eqz
      br_if 0 (;@1;)
    end
    local.get 0)
  (func (;47;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 1049584
      i32.const 4
      local.get 2
      i32.load offset=12
      call_indirect (type 0)
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      return
    end
    local.get 0
    local.get 1
    i32.const 10
    i32.eq
    i32.store8
    local.get 3
    local.get 1
    local.get 2
    i32.load offset=16
    call_indirect (type 1))
  (func (;48;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.const 1049560
    local.get 1
    call 34)
  (func (;49;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i64.load16_u
    local.get 1
    call 38)
  (func (;50;) (type 3)
    unreachable
    unreachable)
  (func (;51;) (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func (;52;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 31
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 6
      local.get 1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 2
    end
    local.get 0
    i64.const 0
    i64.store offset=16 align=4
    local.get 0
    local.get 2
    i32.store offset=28
    local.get 2
    i32.const 2
    i32.shl
    i32.const 1051368
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1051780
      i32.const 1
      local.get 2
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.store
      local.get 0
      local.get 3
      i32.store offset=24
      local.get 0
      local.get 0
      i32.store offset=12
      local.get 0
      local.get 0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1051780
      local.get 4
      i32.or
      i32.store offset=1051780
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 3
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 5
          i32.load
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 2
          local.set 4
          local.get 2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 0
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 2
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 5
    local.get 0
    i32.store
    local.get 0
    local.get 4
    i32.store offset=24
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func (;53;) (type 6) (param i32)
    local.get 0
    call 54
    unreachable)
  (func (;54;) (type 6) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 2
          br_if 1 (;@2;)
          i32.const 1
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      local.get 0
      i32.store offset=12
      local.get 1
      i32.const 7
      local.get 0
      i32.load offset=28
      local.tee 0
      i32.load8_u offset=28
      local.get 0
      i32.load8_u offset=29
      call 55
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 8
    local.get 0
    i32.load offset=28
    local.tee 0
    i32.load8_u offset=28
    local.get 0
    i32.load8_u offset=29
    call 55
    unreachable)
  (func (;55;) (type 10) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    i32.const 0
    i32.const 0
    i32.load offset=1051364
    local.tee 5
    i32.const 1
    i32.add
    i32.store offset=1051364
    block  ;; label = @1
      local.get 5
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1051824
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1051820
          i32.const 1
          i32.add
          i32.store offset=1051820
          i32.const 0
          i32.load offset=1051360
          i32.const -1
          i32.gt_s
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 4
        i32.const 8
        i32.add
        local.get 0
        local.get 1
        call_indirect (type 2)
        unreachable
        unreachable
      end
      i32.const 0
      i32.const 0
      i32.store8 offset=1051824
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      call 50
      unreachable
    end
    unreachable
    unreachable)
  (func (;56;) (type 2) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func (;57;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.load8_u
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        i32.const 1050876
        i32.const 4
        local.get 1
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        local.set 0
        br 1 (;@1;)
      end
      i32.const 1
      local.set 0
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1050880
      i32.const 4
      local.get 1
      i32.load offset=24
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 0)
      br_if 0 (;@1;)
      local.get 3
      i32.const 1
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=28
          local.tee 7
          i32.const 4
          i32.and
          br_if 0 (;@3;)
          i32.const 1
          local.set 0
          local.get 4
          i32.const 1049601
          i32.const 1
          local.get 6
          call_indirect (type 0)
          br_if 2 (;@1;)
          local.get 3
          local.get 1
          call 58
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 4
        i32.const 1049602
        i32.const 2
        local.get 6
        call_indirect (type 0)
        br_if 1 (;@1;)
        i32.const 1
        local.set 0
        local.get 2
        i32.const 1
        i32.store8 offset=27
        local.get 2
        local.get 5
        i32.store offset=16
        local.get 2
        local.get 4
        i32.store offset=12
        local.get 2
        local.get 7
        i32.store offset=56
        local.get 2
        i32.const 1049560
        i32.store offset=52
        local.get 2
        local.get 1
        i32.load8_u offset=32
        i32.store8 offset=60
        local.get 2
        local.get 1
        i32.load offset=16
        i32.store offset=44
        local.get 2
        local.get 1
        i64.load offset=8 align=4
        i64.store offset=36 align=4
        local.get 2
        local.get 1
        i64.load align=4
        i64.store offset=28 align=4
        local.get 2
        local.get 2
        i32.const 27
        i32.add
        i32.store offset=20
        local.get 2
        local.get 2
        i32.const 12
        i32.add
        i32.store offset=48
        local.get 3
        local.get 2
        i32.const 28
        i32.add
        call 58
        br_if 1 (;@1;)
        local.get 2
        i32.load offset=48
        i32.const 1049596
        i32.const 2
        local.get 2
        i32.load offset=52
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load offset=20
      i32.const 1049280
      i32.const 1
      local.get 1
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 0)
      local.set 0
    end
    local.get 2
    i32.const 64
    i32.add
    global.set 0
    local.get 0)
  (func (;58;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=28
            local.tee 3
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 3
            i32.const 32
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i64.load8_u
            local.get 1
            call 38
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          i32.load8_u
          local.set 0
          i32.const 127
          local.set 3
          loop  ;; label = @4
            local.get 2
            local.get 3
            local.tee 4
            i32.add
            local.tee 5
            local.get 0
            i32.const 15
            i32.and
            local.tee 3
            i32.const 48
            i32.or
            local.get 3
            i32.const 87
            i32.add
            local.get 3
            i32.const 10
            i32.lt_u
            select
            i32.store8
            local.get 4
            i32.const -1
            i32.add
            local.set 3
            local.get 0
            i32.const 255
            i32.and
            local.tee 6
            i32.const 4
            i32.shr_u
            local.set 0
            local.get 6
            i32.const 16
            i32.ge_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 0
        i32.load8_u
        local.set 0
        i32.const 127
        local.set 3
        loop  ;; label = @3
          local.get 2
          local.get 3
          local.tee 4
          i32.add
          local.tee 5
          local.get 0
          i32.const 15
          i32.and
          local.tee 3
          i32.const 48
          i32.or
          local.get 3
          i32.const 55
          i32.add
          local.get 3
          i32.const 10
          i32.lt_u
          select
          i32.store8
          local.get 4
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 255
          i32.and
          local.tee 6
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 6
          i32.const 16
          i32.ge_u
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 129
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          call 36
          unreachable
        end
        local.get 1
        i32.const 1049648
        i32.const 2
        local.get 5
        i32.const 129
        local.get 4
        i32.const 1
        i32.add
        i32.sub
        call 39
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 129
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        call 36
        unreachable
      end
      local.get 1
      i32.const 1049648
      i32.const 2
      local.get 5
      i32.const 129
      local.get 4
      i32.const 1
      i32.add
      i32.sub
      call 39
      local.set 0
    end
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func (;59;) (type 1) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.load8_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 1049850
      i32.const 5
      call 41
      return
    end
    local.get 1
    i32.const 1049855
    i32.const 4
    call 41)
  (func (;60;) (type 9) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1051840
          i32.const 3
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.const 1051828
          i32.store offset=8
          local.get 1
          local.get 1
          i32.const 31
          i32.add
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=4
          local.get 1
          i32.const 4
          i32.add
          call 61
          i32.const 0
          i32.load8_u offset=1051840
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        i32.const 0
        i32.load8_u offset=1051828
        local.set 0
        i32.const 0
        i32.const 1
        i32.store8 offset=1051828
        local.get 1
        local.get 0
        i32.store8
        local.get 0
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store8 offset=1051828
        i32.const 0
        i32.load offset=1051832
        local.set 0
        local.get 1
        i32.const 32
        i32.add
        global.set 0
        local.get 0
        return
      end
      call 13
      unreachable
    end
    local.get 1
    i64.const 0
    i64.store offset=16 align=4
    local.get 1
    i64.const 17179869185
    i64.store offset=8 align=4
    local.get 1
    i32.const 1050640
    i32.store offset=4
    local.get 1
    local.get 1
    i32.const 4
    i32.add
    call 14
    unreachable)
  (func (;61;) (type 6) (param i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.load8_u offset=1051840
            local.tee 2
            i32.const 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const -2
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;)
          end
          i32.const 0
          i32.const 2
          i32.store8 offset=1051840
          local.get 0
          i32.load
          local.set 2
          local.get 0
          i32.const 0
          i32.store
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=4
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load
              local.tee 2
              br_if 0 (;@5;)
              i32.const 1
              local.set 3
              br 1 (;@4;)
            end
            i32.const 0
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i32.const 0
                i32.lt_s
                br_if 0 (;@6;)
                local.get 2
                call 20
                local.tee 3
                br_if 1 (;@5;)
                i32.const 1
                local.set 3
              end
              local.get 3
              local.get 2
              call 23
              unreachable
            end
            local.get 3
            i32.const -4
            i32.add
            i32.load8_u
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.const 0
            local.get 2
            call 69
            drop
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 3
          i32.store offset=4
          local.get 0
          i32.const 0
          i32.store8
          i32.const 0
          i32.const 3
          i32.store8 offset=1051840
        end
        local.get 1
        i32.const 32
        i32.add
        global.set 0
        return
      end
      i32.const 1050592
      call 9
      unreachable
    end
    local.get 1
    i32.const 0
    i32.store offset=24
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1050492
    i32.store offset=8
    local.get 1
    i64.const 4
    i64.store offset=16 align=4
    local.get 1
    i32.const 8
    i32.add
    i32.const 1050576
    call 25
    unreachable)
  (func (;62;) (type 6) (param i32)
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1051848
      i32.const 3
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1051844
      call_indirect (type 3)
    end)
  (func (;63;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                i32.const 0
                                i32.load8_u offset=1051840
                                i32.const 3
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load8_u offset=1051828
                                local.set 3
                                i32.const 0
                                i32.const 1
                                i32.store8 offset=1051828
                                local.get 2
                                local.get 3
                                i32.store8 offset=96
                                block  ;; label = @15
                                  local.get 3
                                  br_if 0 (;@15;)
                                  local.get 0
                                  i32.const 2
                                  i32.add
                                  local.set 3
                                  block  ;; label = @16
                                    local.get 0
                                    i32.const -3
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    block  ;; label = @17
                                      local.get 3
                                      i32.const 0
                                      i32.load offset=1051836
                                      local.tee 4
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 2
                                      i32.const 0
                                      i32.load offset=1051832
                                      local.get 0
                                      i32.add
                                      i32.load16_u align=1
                                      local.tee 5
                                      i32.store16 offset=46
                                      i32.const 0
                                      i32.const 0
                                      i32.store8 offset=1051828
                                      local.get 5
                                      i32.const 7
                                      i32.ne
                                      br_if 4 (;@13;)
                                      i32.const 0
                                      i32.const 1
                                      i32.store8 offset=1051828
                                      local.get 0
                                      i32.const 4
                                      i32.add
                                      local.set 5
                                      block  ;; label = @18
                                        local.get 3
                                        i32.const -3
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        block  ;; label = @19
                                          local.get 5
                                          local.get 4
                                          i32.gt_u
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          i32.const 1
                                          i32.store8 offset=1051828
                                          local.get 0
                                          i32.const 6
                                          i32.add
                                          local.set 3
                                          block  ;; label = @20
                                            local.get 5
                                            i32.const -3
                                            i32.gt_u
                                            br_if 0 (;@20;)
                                            block  ;; label = @21
                                              local.get 3
                                              local.get 4
                                              i32.gt_u
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              i32.const 1
                                              i32.store8 offset=1051828
                                              local.get 0
                                              i32.const 8
                                              i32.add
                                              local.set 0
                                              block  ;; label = @22
                                                local.get 3
                                                i32.const -3
                                                i32.gt_u
                                                br_if 0 (;@22;)
                                                block  ;; label = @23
                                                  local.get 0
                                                  local.get 4
                                                  i32.gt_u
                                                  br_if 0 (;@23;)
                                                  i32.const 0
                                                  local.set 3
                                                  i32.const 0
                                                  i32.const 0
                                                  i32.store8 offset=1051828
                                                  local.get 2
                                                  i32.const 8
                                                  i32.add
                                                  local.get 2
                                                  call 6
                                                  local.get 2
                                                  i32.load8_u offset=8
                                                  local.set 0
                                                  local.get 2
                                                  i32.load8_u offset=9
                                                  local.set 4
                                                  local.get 2
                                                  i32.load8_u offset=10
                                                  local.set 5
                                                  local.get 2
                                                  i32.load8_u offset=11
                                                  local.set 6
                                                  local.get 2
                                                  i32.load8_u offset=12
                                                  local.set 7
                                                  local.get 2
                                                  i32.load8_u offset=13
                                                  local.set 8
                                                  local.get 2
                                                  i32.load8_u offset=14
                                                  local.set 9
                                                  local.get 2
                                                  i32.load8_u offset=15
                                                  local.set 10
                                                  local.get 2
                                                  i32.load8_u offset=16
                                                  local.set 11
                                                  local.get 2
                                                  i32.load8_u offset=17
                                                  local.set 12
                                                  local.get 2
                                                  i32.load8_u offset=18
                                                  local.set 13
                                                  local.get 2
                                                  i32.load8_u offset=19
                                                  local.set 14
                                                  local.get 2
                                                  i32.load8_u offset=20
                                                  local.set 15
                                                  local.get 2
                                                  i32.load8_u offset=21
                                                  local.set 16
                                                  local.get 2
                                                  i32.load8_u offset=22
                                                  local.set 17
                                                  local.get 2
                                                  i32.load8_u offset=23
                                                  local.set 18
                                                  local.get 2
                                                  i32.load8_u offset=24
                                                  local.set 19
                                                  local.get 2
                                                  i32.load8_u offset=25
                                                  local.set 20
                                                  local.get 2
                                                  i32.load8_u offset=26
                                                  local.set 21
                                                  local.get 2
                                                  i32.load8_u offset=27
                                                  local.set 22
                                                  local.get 2
                                                  i32.load8_u offset=28
                                                  local.set 23
                                                  local.get 2
                                                  i32.load8_u offset=29
                                                  local.set 24
                                                  local.get 2
                                                  i32.load8_u offset=30
                                                  local.set 25
                                                  local.get 2
                                                  i32.load8_u offset=31
                                                  local.set 26
                                                  local.get 2
                                                  i32.load8_u offset=32
                                                  local.set 27
                                                  local.get 2
                                                  i32.load8_u offset=33
                                                  local.set 28
                                                  local.get 2
                                                  local.get 2
                                                  i64.load offset=34 align=2
                                                  i64.store offset=74 align=2
                                                  local.get 2
                                                  local.get 28
                                                  i32.store8 offset=73
                                                  local.get 2
                                                  local.get 27
                                                  i32.store8 offset=72
                                                  local.get 2
                                                  local.get 26
                                                  i32.store8 offset=71
                                                  local.get 2
                                                  local.get 25
                                                  i32.store8 offset=70
                                                  local.get 2
                                                  local.get 24
                                                  i32.store8 offset=69
                                                  local.get 2
                                                  local.get 23
                                                  i32.store8 offset=68
                                                  local.get 2
                                                  local.get 22
                                                  i32.store8 offset=67
                                                  local.get 2
                                                  local.get 21
                                                  i32.store8 offset=66
                                                  local.get 2
                                                  local.get 20
                                                  i32.store8 offset=65
                                                  local.get 2
                                                  local.get 19
                                                  i32.store8 offset=64
                                                  local.get 2
                                                  local.get 18
                                                  i32.store8 offset=63
                                                  local.get 2
                                                  local.get 17
                                                  i32.store8 offset=62
                                                  local.get 2
                                                  local.get 16
                                                  i32.store8 offset=61
                                                  local.get 2
                                                  local.get 15
                                                  i32.store8 offset=60
                                                  local.get 2
                                                  local.get 14
                                                  i32.store8 offset=59
                                                  local.get 2
                                                  local.get 13
                                                  i32.store8 offset=58
                                                  local.get 2
                                                  local.get 12
                                                  i32.store8 offset=57
                                                  local.get 2
                                                  local.get 11
                                                  i32.store8 offset=56
                                                  local.get 2
                                                  local.get 10
                                                  i32.store8 offset=55
                                                  local.get 2
                                                  local.get 9
                                                  i32.store8 offset=54
                                                  local.get 2
                                                  local.get 8
                                                  i32.store8 offset=53
                                                  local.get 2
                                                  local.get 7
                                                  i32.store8 offset=52
                                                  local.get 2
                                                  local.get 6
                                                  i32.store8 offset=51
                                                  local.get 2
                                                  local.get 5
                                                  i32.store8 offset=50
                                                  local.get 2
                                                  local.get 4
                                                  i32.store8 offset=49
                                                  local.get 2
                                                  local.get 0
                                                  i32.store8 offset=48
                                                  i32.const 0
                                                  i32.load8_u offset=1051840
                                                  i32.const 3
                                                  i32.ne
                                                  br_if 9 (;@14;)
                                                  block  ;; label = @24
                                                    local.get 0
                                                    i32.const 255
                                                    i32.and
                                                    i32.eqz
                                                    br_if 0 (;@24;)
                                                    block  ;; label = @25
                                                      local.get 4
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 1
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 5
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 2
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 6
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 3
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 7
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 4
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 8
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 5
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 9
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 6
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 10
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 7
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 11
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 8
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 12
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 9
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 13
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 10
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 14
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 11
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 15
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 12
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 16
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 13
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 17
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 14
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 18
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 15
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 19
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 16
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 20
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 17
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 21
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 18
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 22
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 19
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 23
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 20
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 24
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 21
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 25
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 22
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 26
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 23
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 27
                                                      i32.const 255
                                                      i32.and
                                                      br_if 0 (;@25;)
                                                      i32.const 24
                                                      local.set 3
                                                      br 1 (;@24;)
                                                    end
                                                    i32.const 26
                                                    i32.const 25
                                                    local.get 28
                                                    i32.const 255
                                                    i32.and
                                                    select
                                                    local.set 3
                                                  end
                                                  local.get 3
                                                  i32.eqz
                                                  br_if 11 (;@12;)
                                                  i32.const 0
                                                  local.get 3
                                                  i32.const -7
                                                  i32.add
                                                  local.tee 0
                                                  local.get 0
                                                  local.get 3
                                                  i32.gt_u
                                                  select
                                                  local.set 5
                                                  local.get 2
                                                  i32.const 48
                                                  i32.add
                                                  i32.const 3
                                                  i32.add
                                                  i32.const -4
                                                  i32.and
                                                  local.get 2
                                                  i32.const 48
                                                  i32.add
                                                  i32.sub
                                                  local.set 9
                                                  i32.const 0
                                                  local.set 0
                                                  loop  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            local.get 2
                                                            i32.const 48
                                                            i32.add
                                                            local.get 0
                                                            i32.add
                                                            i32.load8_u
                                                            local.tee 4
                                                            i32.extend8_s
                                                            local.tee 6
                                                            i32.const 0
                                                            i32.lt_s
                                                            br_if 0 (;@28;)
                                                            local.get 9
                                                            local.get 0
                                                            i32.sub
                                                            i32.const 3
                                                            i32.and
                                                            br_if 1 (;@27;)
                                                            local.get 0
                                                            local.get 5
                                                            i32.ge_u
                                                            br_if 2 (;@26;)
                                                            loop  ;; label = @29
                                                              local.get 2
                                                              i32.const 48
                                                              i32.add
                                                              local.get 0
                                                              i32.add
                                                              local.tee 4
                                                              i32.const 4
                                                              i32.add
                                                              i32.load
                                                              local.get 4
                                                              i32.load
                                                              i32.or
                                                              i32.const -2139062144
                                                              i32.and
                                                              br_if 3 (;@26;)
                                                              local.get 0
                                                              i32.const 8
                                                              i32.add
                                                              local.tee 0
                                                              local.get 5
                                                              i32.lt_u
                                                              br_if 0 (;@29;)
                                                              br 3 (;@26;)
                                                            end
                                                          end
                                                          i32.const 256
                                                          local.set 7
                                                          i32.const 1
                                                          local.set 8
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      block  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            local.get 4
                                                                                            i32.const 1050012
                                                                                            i32.add
                                                                                            i32.load8_u
                                                                                            i32.const -2
                                                                                            i32.add
                                                                                            br_table 0 (;@44;) 1 (;@43;) 2 (;@42;) 16 (;@28;)
                                                                                          end
                                                                                          local.get 0
                                                                                          i32.const 1
                                                                                          i32.add
                                                                                          local.tee 4
                                                                                          local.get 3
                                                                                          i32.lt_u
                                                                                          br_if 2 (;@41;)
                                                                                          i32.const 0
                                                                                          local.set 7
                                                                                          br 14 (;@29;)
                                                                                        end
                                                                                        i32.const 0
                                                                                        local.set 7
                                                                                        local.get 0
                                                                                        i32.const 1
                                                                                        i32.add
                                                                                        local.tee 8
                                                                                        local.get 3
                                                                                        i32.ge_u
                                                                                        br_if 13 (;@29;)
                                                                                        local.get 2
                                                                                        i32.const 48
                                                                                        i32.add
                                                                                        local.get 8
                                                                                        i32.add
                                                                                        i32.load8_s
                                                                                        local.set 8
                                                                                        local.get 4
                                                                                        i32.const -224
                                                                                        i32.add
                                                                                        br_table 2 (;@40;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 4 (;@38;) 3 (;@39;) 4 (;@38;)
                                                                                      end
                                                                                      i32.const 0
                                                                                      local.set 7
                                                                                      local.get 0
                                                                                      i32.const 1
                                                                                      i32.add
                                                                                      local.tee 8
                                                                                      local.get 3
                                                                                      i32.ge_u
                                                                                      br_if 12 (;@29;)
                                                                                      local.get 2
                                                                                      i32.const 48
                                                                                      i32.add
                                                                                      local.get 8
                                                                                      i32.add
                                                                                      i32.load8_s
                                                                                      local.set 8
                                                                                      local.get 4
                                                                                      i32.const -240
                                                                                      i32.add
                                                                                      br_table 5 (;@36;) 4 (;@37;) 4 (;@37;) 4 (;@37;) 6 (;@35;) 4 (;@37;)
                                                                                    end
                                                                                    i32.const 256
                                                                                    local.set 7
                                                                                    i32.const 1
                                                                                    local.set 8
                                                                                    local.get 2
                                                                                    i32.const 48
                                                                                    i32.add
                                                                                    local.get 4
                                                                                    i32.add
                                                                                    i32.load8_s
                                                                                    i32.const -65
                                                                                    i32.gt_s
                                                                                    br_if 12 (;@28;)
                                                                                    br 10 (;@30;)
                                                                                  end
                                                                                  local.get 8
                                                                                  i32.const -32
                                                                                  i32.and
                                                                                  i32.const -96
                                                                                  i32.eq
                                                                                  br_if 7 (;@32;)
                                                                                  br 6 (;@33;)
                                                                                end
                                                                                local.get 8
                                                                                i32.const -97
                                                                                i32.gt_s
                                                                                br_if 5 (;@33;)
                                                                                br 6 (;@32;)
                                                                              end
                                                                              block  ;; label = @38
                                                                                local.get 6
                                                                                i32.const 31
                                                                                i32.add
                                                                                i32.const 255
                                                                                i32.and
                                                                                i32.const 12
                                                                                i32.lt_u
                                                                                br_if 0 (;@38;)
                                                                                local.get 6
                                                                                i32.const -2
                                                                                i32.and
                                                                                i32.const -18
                                                                                i32.ne
                                                                                br_if 5 (;@33;)
                                                                                local.get 8
                                                                                i32.const -64
                                                                                i32.lt_s
                                                                                br_if 6 (;@32;)
                                                                                br 5 (;@33;)
                                                                              end
                                                                              local.get 8
                                                                              i32.const -64
                                                                              i32.lt_s
                                                                              br_if 5 (;@32;)
                                                                              br 4 (;@33;)
                                                                            end
                                                                            local.get 6
                                                                            i32.const 15
                                                                            i32.add
                                                                            i32.const 255
                                                                            i32.and
                                                                            i32.const 2
                                                                            i32.gt_u
                                                                            br_if 3 (;@33;)
                                                                            local.get 8
                                                                            i32.const -64
                                                                            i32.ge_s
                                                                            br_if 3 (;@33;)
                                                                            br 2 (;@34;)
                                                                          end
                                                                          local.get 8
                                                                          i32.const 112
                                                                          i32.add
                                                                          i32.const 255
                                                                          i32.and
                                                                          i32.const 48
                                                                          i32.ge_u
                                                                          br_if 2 (;@33;)
                                                                          br 1 (;@34;)
                                                                        end
                                                                        local.get 8
                                                                        i32.const -113
                                                                        i32.gt_s
                                                                        br_if 1 (;@33;)
                                                                      end
                                                                      local.get 0
                                                                      i32.const 2
                                                                      i32.add
                                                                      local.tee 4
                                                                      local.get 3
                                                                      i32.ge_u
                                                                      br_if 4 (;@29;)
                                                                      local.get 2
                                                                      i32.const 48
                                                                      i32.add
                                                                      local.get 4
                                                                      i32.add
                                                                      i32.load8_s
                                                                      i32.const -65
                                                                      i32.gt_s
                                                                      br_if 2 (;@31;)
                                                                      i32.const 0
                                                                      local.set 8
                                                                      local.get 0
                                                                      i32.const 3
                                                                      i32.add
                                                                      local.tee 4
                                                                      local.get 3
                                                                      i32.ge_u
                                                                      br_if 5 (;@28;)
                                                                      local.get 2
                                                                      i32.const 48
                                                                      i32.add
                                                                      local.get 4
                                                                      i32.add
                                                                      i32.load8_s
                                                                      i32.const -65
                                                                      i32.le_s
                                                                      br_if 3 (;@30;)
                                                                      i32.const 768
                                                                      local.set 7
                                                                      i32.const 1
                                                                      local.set 8
                                                                      br 5 (;@28;)
                                                                    end
                                                                    i32.const 256
                                                                    local.set 7
                                                                    i32.const 1
                                                                    local.set 8
                                                                    br 4 (;@28;)
                                                                  end
                                                                  i32.const 0
                                                                  local.set 8
                                                                  local.get 0
                                                                  i32.const 2
                                                                  i32.add
                                                                  local.tee 4
                                                                  local.get 3
                                                                  i32.ge_u
                                                                  br_if 3 (;@28;)
                                                                  local.get 2
                                                                  i32.const 48
                                                                  i32.add
                                                                  local.get 4
                                                                  i32.add
                                                                  i32.load8_s
                                                                  i32.const -65
                                                                  i32.le_s
                                                                  br_if 1 (;@30;)
                                                                end
                                                                i32.const 512
                                                                local.set 7
                                                                i32.const 1
                                                                local.set 8
                                                                br 2 (;@28;)
                                                              end
                                                              local.get 4
                                                              i32.const 1
                                                              i32.add
                                                              local.set 0
                                                              br 4 (;@25;)
                                                            end
                                                            i32.const 0
                                                            local.set 8
                                                          end
                                                          local.get 2
                                                          local.get 0
                                                          i32.store offset=96
                                                          local.get 2
                                                          local.get 7
                                                          local.get 8
                                                          i32.or
                                                          i32.store offset=100
                                                          i32.const 1051244
                                                          i32.const 25
                                                          local.get 2
                                                          i32.const 96
                                                          i32.add
                                                          i32.const 1051228
                                                          i32.const 1051272
                                                          call 10
                                                          unreachable
                                                        end
                                                        local.get 0
                                                        i32.const 1
                                                        i32.add
                                                        local.set 0
                                                        br 1 (;@25;)
                                                      end
                                                      local.get 0
                                                      local.get 3
                                                      i32.ge_u
                                                      br_if 0 (;@25;)
                                                      loop  ;; label = @26
                                                        local.get 2
                                                        i32.const 48
                                                        i32.add
                                                        local.get 0
                                                        i32.add
                                                        i32.load8_s
                                                        i32.const 0
                                                        i32.lt_s
                                                        br_if 1 (;@25;)
                                                        local.get 3
                                                        local.get 0
                                                        i32.const 1
                                                        i32.add
                                                        local.tee 0
                                                        i32.ne
                                                        br_if 0 (;@26;)
                                                        br 14 (;@12;)
                                                      end
                                                    end
                                                    local.get 0
                                                    local.get 3
                                                    i32.lt_u
                                                    br_if 0 (;@24;)
                                                    br 12 (;@12;)
                                                  end
                                                end
                                                local.get 0
                                                local.get 4
                                                i32.const 1051076
                                                call 3
                                                unreachable
                                              end
                                              local.get 3
                                              local.get 0
                                              i32.const 1051076
                                              call 16
                                              unreachable
                                            end
                                            local.get 3
                                            local.get 4
                                            i32.const 1051076
                                            call 3
                                            unreachable
                                          end
                                          local.get 5
                                          local.get 3
                                          i32.const 1051076
                                          call 16
                                          unreachable
                                        end
                                        local.get 5
                                        local.get 4
                                        i32.const 1051076
                                        call 3
                                        unreachable
                                      end
                                      local.get 3
                                      local.get 5
                                      i32.const 1051076
                                      call 16
                                      unreachable
                                    end
                                    local.get 3
                                    local.get 4
                                    i32.const 1051076
                                    call 3
                                    unreachable
                                  end
                                  local.get 0
                                  local.get 3
                                  i32.const 1051076
                                  call 16
                                  unreachable
                                end
                                local.get 2
                                i64.const 0
                                i64.store offset=60 align=4
                                local.get 2
                                i64.const 17179869185
                                i64.store offset=52 align=4
                                local.get 2
                                i32.const 1050640
                                i32.store offset=48
                                local.get 2
                                i32.const 96
                                i32.add
                                local.get 2
                                i32.const 48
                                i32.add
                                call 14
                                unreachable
                              end
                              call 13
                              unreachable
                            end
                            local.get 2
                            i32.const 2
                            i32.store offset=52
                            local.get 2
                            i32.const 1051344
                            i32.store offset=48
                            local.get 2
                            i64.const 2
                            i64.store offset=60 align=4
                            local.get 2
                            i32.const 9
                            i64.extend_i32_u
                            i64.const 32
                            i64.shl
                            local.tee 29
                            i32.const 1051288
                            i64.extend_i32_u
                            i64.or
                            i64.store offset=104
                            local.get 2
                            local.get 29
                            local.get 2
                            i32.const 46
                            i32.add
                            i64.extend_i32_u
                            i64.or
                            i64.store offset=96
                            i32.const 0
                            i32.load8_u offset=1051852
                            drop
                            local.get 2
                            local.get 2
                            i32.const 96
                            i32.add
                            i32.store offset=56
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    i32.const 104
                                    call 20
                                    local.tee 0
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 2
                                    i32.const 0
                                    i32.store offset=92
                                    local.get 2
                                    local.get 0
                                    i32.store offset=88
                                    local.get 2
                                    i32.const 104
                                    i32.store offset=84
                                    local.get 2
                                    i32.const 84
                                    i32.add
                                    i32.const 1049040
                                    local.get 2
                                    i32.const 48
                                    i32.add
                                    call 34
                                    br_if 1 (;@15;)
                                    local.get 2
                                    i32.load offset=84
                                    local.set 0
                                    i32.const 2
                                    local.get 2
                                    i32.load offset=88
                                    local.tee 3
                                    local.get 2
                                    i32.load offset=92
                                    call 0
                                    block  ;; label = @17
                                      local.get 0
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 3
                                      i32.const -4
                                      i32.add
                                      i32.load
                                      local.tee 1
                                      i32.const -8
                                      i32.and
                                      local.tee 4
                                      i32.const 4
                                      i32.const 8
                                      local.get 1
                                      i32.const 3
                                      i32.and
                                      local.tee 1
                                      select
                                      local.get 0
                                      i32.add
                                      i32.lt_u
                                      br_if 3 (;@14;)
                                      block  ;; label = @18
                                        local.get 1
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 4
                                        local.get 0
                                        i32.const 39
                                        i32.add
                                        i32.gt_u
                                        br_if 5 (;@13;)
                                      end
                                      local.get 3
                                      call 21
                                    end
                                    i32.const 0
                                    local.set 0
                                    br 5 (;@11;)
                                  end
                                  unreachable
                                  unreachable
                                end
                                i32.const 1049152
                                i32.const 86
                                local.get 2
                                i32.const 127
                                i32.add
                                i32.const 1049136
                                i32.const 1049264
                                call 10
                                unreachable
                              end
                              i32.const 1050309
                              i32.const 46
                              i32.const 1050356
                              call 22
                              unreachable
                            end
                            i32.const 1050372
                            i32.const 46
                            i32.const 1050420
                            call 22
                            unreachable
                          end
                          i32.const 0
                          i32.load8_u offset=1051828
                          local.set 0
                          i32.const 0
                          i32.const 1
                          i32.store8 offset=1051828
                          local.get 2
                          local.get 0
                          i32.store8 offset=84
                          local.get 0
                          br_if 1 (;@10;)
                          local.get 3
                          local.get 1
                          i32.add
                          local.tee 0
                          local.get 3
                          i32.lt_u
                          br_if 2 (;@9;)
                          local.get 0
                          i32.const 0
                          i32.load offset=1051836
                          local.tee 4
                          i32.gt_u
                          br_if 3 (;@8;)
                          i32.const 0
                          i32.load offset=1051832
                          local.get 1
                          i32.add
                          local.get 2
                          i32.const 48
                          i32.add
                          local.get 3
                          call 71
                          drop
                          block  ;; label = @12
                            local.get 0
                            local.get 1
                            i32.const 26
                            i32.add
                            i32.ge_u
                            br_if 0 (;@12;)
                            loop  ;; label = @13
                              i32.const 0
                              i32.const 1
                              i32.store8 offset=1051828
                              i32.const 0
                              i32.load offset=1051836
                              local.tee 0
                              local.get 1
                              local.get 3
                              i32.add
                              local.tee 4
                              i32.le_u
                              br_if 12 (;@1;)
                              i32.const 0
                              i32.load offset=1051832
                              local.get 1
                              i32.add
                              local.get 3
                              i32.add
                              i32.const 0
                              i32.store8
                              i32.const 0
                              i32.const 0
                              i32.store8 offset=1051828
                              local.get 3
                              i32.const 1
                              i32.add
                              local.tee 3
                              i32.const 26
                              i32.ne
                              br_if 0 (;@13;)
                            end
                            local.get 1
                            local.get 3
                            i32.add
                            local.set 0
                          end
                          i32.const 0
                          i32.const 1
                          i32.store8 offset=1051828
                          local.get 0
                          i32.const 2
                          i32.add
                          local.set 3
                          local.get 0
                          i32.const -3
                          i32.gt_u
                          br_if 4 (;@7;)
                          local.get 3
                          i32.const 0
                          i32.load offset=1051836
                          local.tee 1
                          i32.gt_u
                          br_if 5 (;@6;)
                          i32.const 0
                          i32.load offset=1051832
                          local.get 0
                          i32.add
                          local.get 2
                          i32.load16_u offset=74
                          i32.store16 align=1
                          i32.const 0
                          i32.const 1
                          i32.store8 offset=1051828
                          local.get 0
                          i32.const 4
                          i32.add
                          local.set 1
                          local.get 3
                          i32.const -3
                          i32.gt_u
                          br_if 6 (;@5;)
                          local.get 1
                          i32.const 0
                          i32.load offset=1051836
                          local.tee 4
                          i32.gt_u
                          br_if 7 (;@4;)
                          i32.const 0
                          i32.load offset=1051832
                          local.get 3
                          i32.add
                          local.get 2
                          i32.load16_u offset=76
                          i32.store16 align=1
                          i32.const 0
                          i32.const 1
                          i32.store8 offset=1051828
                          local.get 0
                          i32.const 6
                          i32.add
                          local.set 0
                          local.get 1
                          i32.const -3
                          i32.gt_u
                          br_if 8 (;@3;)
                          local.get 0
                          i32.const 0
                          i32.load offset=1051836
                          local.tee 3
                          i32.gt_u
                          br_if 9 (;@2;)
                          i32.const 0
                          i32.load offset=1051832
                          local.get 1
                          i32.add
                          local.get 2
                          i32.load16_u offset=78
                          i32.store16 align=1
                          i32.const 0
                          i32.const 0
                          i32.store8 offset=1051828
                          local.get 2
                          i32.load8_u offset=80
                          i32.const 0
                          i32.ne
                          local.set 0
                        end
                        local.get 2
                        i32.const 128
                        i32.add
                        global.set 0
                        local.get 0
                        return
                      end
                      local.get 2
                      i64.const 0
                      i64.store offset=108 align=4
                      local.get 2
                      i64.const 17179869185
                      i64.store offset=100 align=4
                      local.get 2
                      i32.const 1050640
                      i32.store offset=96
                      local.get 2
                      i32.const 84
                      i32.add
                      local.get 2
                      i32.const 96
                      i32.add
                      call 14
                      unreachable
                    end
                    local.get 1
                    local.get 0
                    i32.const 1050996
                    call 16
                    unreachable
                  end
                  local.get 0
                  local.get 4
                  i32.const 1050996
                  call 3
                  unreachable
                end
                local.get 0
                local.get 3
                i32.const 1051028
                call 16
                unreachable
              end
              local.get 3
              local.get 1
              i32.const 1051028
              call 3
              unreachable
            end
            local.get 3
            local.get 1
            i32.const 1051028
            call 16
            unreachable
          end
          local.get 1
          local.get 4
          i32.const 1051028
          call 3
          unreachable
        end
        local.get 1
        local.get 0
        i32.const 1051028
        call 16
        unreachable
      end
      local.get 0
      local.get 3
      i32.const 1051028
      call 3
      unreachable
    end
    local.get 4
    local.get 0
    i32.const 1051012
    call 15
    unreachable)
  (func (;64;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 0
    i32.const 4
    i32.add
    i32.store offset=4
    local.get 1
    i32.load offset=20
    i32.const 1051138
    i32.const 9
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 0)
    local.set 3
    local.get 2
    i32.const 0
    i32.store8 offset=13
    local.get 2
    local.get 3
    i32.store8 offset=12
    local.get 2
    local.get 1
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    i32.const 1051147
    i32.const 11
    local.get 0
    i32.const 10
    call 5
    i32.const 1051158
    i32.const 9
    local.get 2
    i32.const 4
    i32.add
    i32.const 11
    call 5
    local.set 3
    local.get 2
    i32.load8_u offset=12
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load8_u offset=13
        br_if 0 (;@2;)
        local.get 0
        i32.const 255
        i32.and
        i32.const 0
        i32.ne
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1
      local.set 1
      local.get 0
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.load
        local.tee 1
        i32.load8_u offset=28
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        i32.const 1049599
        i32.const 2
        local.get 1
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=20
      i32.const 1049598
      i32.const 1
      local.get 1
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 0)
      local.set 1
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0
    local.get 1)
  (func (;65;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 128
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=28
            local.tee 3
            i32.const 16
            i32.and
            br_if 0 (;@4;)
            local.get 3
            i32.const 32
            i32.and
            br_if 1 (;@3;)
            local.get 0
            i64.load32_u
            local.get 1
            call 38
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          i32.load
          local.set 0
          i32.const 127
          local.set 3
          loop  ;; label = @4
            local.get 2
            local.get 3
            local.tee 4
            i32.add
            local.tee 5
            local.get 0
            i32.const 15
            i32.and
            local.tee 3
            i32.const 48
            i32.or
            local.get 3
            i32.const 87
            i32.add
            local.get 3
            i32.const 10
            i32.lt_u
            select
            i32.store8
            local.get 4
            i32.const -1
            i32.add
            local.set 3
            local.get 0
            i32.const 16
            i32.lt_u
            local.set 6
            local.get 0
            i32.const 4
            i32.shr_u
            local.set 0
            local.get 6
            i32.eqz
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 0
        i32.load
        local.set 0
        i32.const 127
        local.set 3
        loop  ;; label = @3
          local.get 2
          local.get 3
          local.tee 4
          i32.add
          local.tee 5
          local.get 0
          i32.const 15
          i32.and
          local.tee 3
          i32.const 48
          i32.or
          local.get 3
          i32.const 55
          i32.add
          local.get 3
          i32.const 10
          i32.lt_u
          select
          i32.store8
          local.get 4
          i32.const -1
          i32.add
          local.set 3
          local.get 0
          i32.const 16
          i32.lt_u
          local.set 6
          local.get 0
          i32.const 4
          i32.shr_u
          local.set 0
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
        end
        block  ;; label = @3
          local.get 4
          i32.const 129
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          call 36
          unreachable
        end
        local.get 1
        i32.const 1049648
        i32.const 2
        local.get 5
        i32.const 129
        local.get 4
        i32.const 1
        i32.add
        i32.sub
        call 39
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        i32.const 129
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        call 36
        unreachable
      end
      local.get 1
      i32.const 1049648
      i32.const 2
      local.get 5
      i32.const 129
      local.get 4
      i32.const 1
      i32.add
      i32.sub
      call 39
      local.set 0
    end
    local.get 2
    i32.const 128
    i32.add
    global.set 0
    local.get 0)
  (func (;66;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        local.get 1
        local.set 6
        loop  ;; label = @3
          local.get 3
          local.get 6
          i32.load8_u
          i32.store8
          local.get 6
          i32.const 1
          i32.add
          local.set 6
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 5
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      local.tee 7
      i32.const -4
      i32.and
      local.tee 8
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 4
          i32.add
          local.tee 9
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 1 (;@2;)
          local.get 9
          i32.const 3
          i32.shl
          local.tee 6
          i32.const 24
          i32.and
          local.set 2
          local.get 9
          i32.const -4
          i32.and
          local.tee 10
          i32.const 4
          i32.add
          local.set 1
          i32.const 0
          local.get 6
          i32.sub
          i32.const 24
          i32.and
          local.set 4
          local.get 10
          i32.load
          local.set 6
          loop  ;; label = @4
            local.get 5
            local.get 6
            local.get 2
            i32.shr_u
            local.get 1
            i32.load
            local.tee 6
            local.get 4
            i32.shl
            i32.or
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 4
            i32.add
            local.tee 5
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 8
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 9
        local.set 1
        loop  ;; label = @3
          local.get 5
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 4
          i32.add
          local.tee 5
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 7
      i32.const 3
      i32.and
      local.set 2
      local.get 9
      local.get 8
      i32.add
      local.set 1
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 5
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;67;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.store8
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 5
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      local.tee 4
      i32.const -4
      i32.and
      local.tee 2
      i32.add
      local.set 3
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 1
        i32.const 255
        i32.and
        i32.const 16843009
        i32.mul
        local.set 2
        loop  ;; label = @3
          local.get 5
          local.get 2
          i32.store
          local.get 5
          i32.const 4
          i32.add
          local.tee 5
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 4
      i32.const 3
      i32.and
      local.set 2
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 5
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;68;) (type 0) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func (;69;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 67)
  (func (;70;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 68)
  (func (;71;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 66)
  (table (;0;) 23 23 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1051853))
  (global (;2;) i32 (i32.const 1051856))
  (export "memory" (memory 0))
  (export "client_setup" (func 6))
  (export "runFib" (func 12))
  (export "setup" (func 60))
  (export "tick" (func 62))
  (export "receiveGameParams" (func 63))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func 37 1 7 43 44 45 51 56 49 65 57 4 29 30 31 33 28 46 47 48 59 64)
  (data (;0;) (i32.const 1048576) "/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/core/src/str/pattern.rsEmptyInvalidDigitPosOverflowNegOverflowZeroParseIntErrorkind\00\00\00\10\00O\00\00\00\bf\01\00\007\00\00\000.1.0src/lib.rs\00\a1\00\10\00\0a\00\00\00\15\00\00\00&\00\00\00\a1\00\10\00\0a\00\00\00\16\00\00\00&\00\00\00\a1\00\10\00\0a\00\00\00\17\00\00\00&\00\00\00Good to go!\00\00\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00Semver parts must fit in u16\a1\00\10\00\0a\00\00\00\17\00\00\00>\00\00\00\a1\00\10\00\0a\00\00\00\16\00\00\00>\00\00\00\a1\00\10\00\0a\00\00\00\15\00\00\00>\00\00\00CLIENT ERROR: version must be semverFib index too highInvalid offsetInvalid result offset\00\00\00\05\00\00\00\0c\00\00\00\0b\00\00\00\0b\00\00\00\04\00\00\00O\00\10\00T\00\10\00`\00\10\00k\00\10\00v\00\10\00Error\00\00\00\0d\00\00\00\0c\00\00\00\04\00\00\00\0e\00\00\00\0f\00\00\00\10\00\00\00capacity overflow\00\00\00\e8\01\10\00\11\00\00\00library/alloc/src/raw_vec.rs\04\02\10\00\1c\00\00\00\19\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\11\00\00\00a formatting trait implementation returned an error when the underlying stream did notlibrary/alloc/src/fmt.rs\00\00\96\02\10\00\18\00\00\00\7f\02\00\00\0e\00\00\00)\00\00\00\01\00\00\00\00\00\00\00called `Option::unwrap()` on a `None` valueindex out of bounds: the len is  but the index is \00\00\00\f7\02\10\00 \00\00\00\17\03\10\00\12\00\00\00==assertion `left  right` failed\0a  left: \0a right: \00\00>\03\10\00\10\00\00\00N\03\10\00\17\00\00\00e\03\10\00\09\00\00\00 right` failed: \0a  left: \00\00\00>\03\10\00\10\00\00\00\88\03\10\00\10\00\00\00\98\03\10\00\09\00\00\00e\03\10\00\09\00\00\00: \00\00\01\00\00\00\00\00\00\00\c4\03\10\00\02\00\00\00\00\00\00\00\0c\00\00\00\04\00\00\00\12\00\00\00\13\00\00\00\14\00\00\00     { ,  {\0a,\0a} }((\0alibrary/core/src/fmt/num.rs\00\04\04\10\00\1b\00\00\00i\00\00\00\17\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899falsetruerange start index  out of range for slice of length \00\03\05\10\00\12\00\00\00\15\05\10\00\22\00\00\00range end index H\05\10\00\10\00\00\00\15\05\10\00\22\00\00\00slice index starts at  but ends at \00h\05\10\00\16\00\00\00~\05\10\00\0d\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00/rust/deps/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00\9c\06\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\9c\06\10\00)\00\00\00\ae\04\00\00\0d\00\00\00one-time initialization may not be performed recursivelyD\07\10\008\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sync/once.rs\84\07\10\00L\00\00\00\d9\00\00\00\14\00\00\00\84\07\10\00L\00\00\00\d9\00\00\001\00\00\00cannot recursively acquire mutex\f0\07\10\00 \00\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sys/sync/mutex/no_threads.rs\00\00\00\19\08\10\00\5c\00\00\00\14\00\00\00\09\00\00\00/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/std/src/sync/once_lock.rs\00\00\00\88\08\10\00Q\00\00\00\ec\00\00\004\00\00\00\00\00\00\00\04\00\00\00\04\00\00\00\15\00\00\00NoneSomeReserve memory not initialized/Users/shane/Projects/wasmbots/libraries/Rust/src/host_reserve.rs\00\22\09\10\00A\00\00\00\13\00\00\00&\00\00\00\22\09\10\00A\00\00\00#\00\00\00\0e\00\00\00\22\09\10\00A\00\00\00)\00\00\00\09\00\00\00\22\09\10\00A\00\00\00:\00\00\00\0e\00\00\00\22\09\10\00A\00\00\00V\00\00\00\0e\00\00\00\22\09\10\00A\00\00\00j\00\00\00\09\00\00\00\22\09\10\00A\00\00\00p\00\00\00*\00\00\00CLIENT ERROR: Tick callback already registeredUtf8Errorvalid_up_toerror_len/Users/shane/Projects/wasmbots/libraries/Rust/src/params.rs\00\00\00\00\00\00\08\00\00\00\04\00\00\00\16\00\00\00Invalid UTF-8 in bot name\00\00\00\1f\0a\10\00;\00\00\00=\00\00\00E\00\00\00\07\00ERROR: Can't parse GameParams v; only prepared for v\00\00\9a\0a\10\00\1f\00\00\00\b9\0a\10\00\15\00\00\00"))
