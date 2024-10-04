(module
  (type (;0;) (func (param i32 i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32)))
  (type (;6;) (func (param i64) (result i64)))
  (type (;7;) (func))
  (type (;8;) (func (param i32 i32 i32 i32)))
  (type (;9;) (func (param i64 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32) (result i32)))
  (import "env" "logFunction" (func (;0;) (type 3)))
  (func (;1;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load8_u offset=37
        i32.eqz
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=4
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.load offset=16
        local.tee 4
        local.get 1
        i32.load offset=12
        local.tee 5
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        local.get 1
        i32.load offset=8
        local.tee 6
        i32.gt_u
        local.tee 7
        br_if 0 (;@2;)
        local.get 1
        i32.const 20
        i32.add
        local.set 8
        local.get 1
        local.get 1
        i32.load8_u offset=24
        local.tee 9
        i32.add
        i32.const 19
        i32.add
        i32.load8_u
        local.tee 10
        i32.const 16843009
        i32.mul
        local.set 11
        local.get 9
        i32.const 5
        i32.lt_u
        local.set 12
        loop  ;; label = @3
          local.get 3
          local.get 5
          i32.add
          local.set 13
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 4
                  local.get 5
                  i32.sub
                  local.tee 14
                  i32.const 7
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 4
                  local.get 5
                  i32.eq
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 15
                  loop  ;; label = @8
                    local.get 13
                    local.get 15
                    i32.add
                    i32.load8_u
                    local.get 10
                    i32.eq
                    br_if 4 (;@4;)
                    local.get 14
                    local.get 15
                    i32.const 1
                    i32.add
                    local.tee 15
                    i32.ne
                    br_if 0 (;@8;)
                    br 2 (;@6;)
                  end
                end
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 13
                      i32.const 3
                      i32.add
                      i32.const -4
                      i32.and
                      local.tee 15
                      local.get 13
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 15
                      local.get 13
                      i32.sub
                      local.tee 15
                      local.get 14
                      local.get 15
                      local.get 14
                      i32.lt_u
                      select
                      local.set 16
                      i32.const 0
                      local.set 15
                      loop  ;; label = @10
                        local.get 13
                        local.get 15
                        i32.add
                        i32.load8_u
                        local.get 10
                        i32.eq
                        br_if 6 (;@4;)
                        local.get 16
                        local.get 15
                        i32.const 1
                        i32.add
                        local.tee 15
                        i32.ne
                        br_if 0 (;@10;)
                      end
                      local.get 16
                      local.get 14
                      i32.const -8
                      i32.add
                      local.tee 17
                      i32.gt_u
                      br_if 2 (;@7;)
                      br 1 (;@8;)
                    end
                    local.get 14
                    i32.const -8
                    i32.add
                    local.set 17
                    i32.const 0
                    local.set 16
                  end
                  loop  ;; label = @8
                    local.get 13
                    local.get 16
                    i32.add
                    local.tee 15
                    i32.const 4
                    i32.add
                    i32.load
                    local.get 11
                    i32.xor
                    local.tee 18
                    i32.const -16843009
                    i32.add
                    local.get 18
                    i32.const -1
                    i32.xor
                    i32.and
                    local.get 15
                    i32.load
                    local.get 11
                    i32.xor
                    local.tee 15
                    i32.const -16843009
                    i32.add
                    local.get 15
                    i32.const -1
                    i32.xor
                    i32.and
                    i32.or
                    i32.const -2139062144
                    i32.and
                    br_if 1 (;@7;)
                    local.get 16
                    i32.const 8
                    i32.add
                    local.tee 16
                    local.get 17
                    i32.le_u
                    br_if 0 (;@8;)
                  end
                end
                local.get 16
                local.get 14
                i32.eq
                br_if 0 (;@6;)
                local.get 13
                local.get 16
                i32.add
                local.set 13
                local.get 4
                local.get 16
                i32.sub
                local.get 5
                i32.sub
                local.set 18
                i32.const 0
                local.set 15
                loop  ;; label = @7
                  local.get 13
                  local.get 15
                  i32.add
                  i32.load8_u
                  local.get 10
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 18
                  local.get 15
                  i32.const 1
                  i32.add
                  local.tee 15
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 1
              local.get 4
              i32.store offset=12
              br 3 (;@2;)
            end
            local.get 15
            local.get 16
            i32.add
            local.set 15
          end
          local.get 1
          local.get 5
          local.get 15
          i32.add
          i32.const 1
          i32.add
          local.tee 5
          i32.store offset=12
          block  ;; label = @4
            local.get 5
            local.get 9
            i32.lt_u
            br_if 0 (;@4;)
            local.get 5
            local.get 6
            i32.gt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 12
              i32.eqz
              br_if 0 (;@5;)
              local.get 3
              local.get 5
              local.get 9
              i32.sub
              local.tee 15
              i32.add
              local.get 8
              local.get 9
              call 50
              br_if 1 (;@4;)
              local.get 1
              i32.load offset=28
              local.set 16
              local.get 1
              local.get 5
              i32.store offset=28
              local.get 3
              local.get 16
              i32.add
              local.set 2
              local.get 15
              local.get 16
              i32.sub
              local.set 15
              br 4 (;@1;)
            end
            local.get 9
            i32.const 4
            i32.const 1048656
            call 2
            unreachable
          end
          local.get 4
          local.get 5
          i32.lt_u
          br_if 1 (;@2;)
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
      end
      local.get 1
      i32.const 1
      i32.store8 offset=37
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load8_u offset=36
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=32
          local.set 13
          local.get 1
          i32.load offset=28
          local.set 16
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=32
        local.tee 13
        local.get 1
        i32.load offset=28
        local.tee 16
        i32.eq
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 16
      i32.add
      local.set 2
      local.get 13
      local.get 16
      i32.sub
      local.set 15
    end
    local.get 0
    local.get 15
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func (;2;) (type 3) (param i32 i32 i32)
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
    i32.const 1049548
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
    call 22
    unreachable)
  (func (;3;) (type 4) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get 0
    i32.const 96
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=32
    local.get 1
    i32.const 2
    i32.store offset=60
    local.get 1
    i32.const 1048760
    i32.store offset=56
    local.get 1
    i64.const 1
    i64.store offset=68 align=4
    local.get 1
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 32
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 1
    local.get 1
    i32.const 48
    i32.add
    i32.store offset=64
    local.get 1
    i32.const 36
    i32.add
    local.get 1
    i32.const 56
    i32.add
    call 5
    i32.const 2
    local.get 1
    i32.load offset=40
    local.tee 2
    local.get 1
    i32.load offset=44
    call 0
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=32
      local.tee 4
      i32.const 0
      i32.load offset=1049792
      local.tee 0
      i32.le_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049788
        local.get 0
        i32.sub
        local.get 4
        local.get 0
        i32.sub
        local.tee 5
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 5
        call 6
        i32.const 0
        i32.load offset=1049792
        local.set 0
      end
      i32.const 0
      i32.load offset=1049784
      local.tee 6
      local.get 0
      i32.add
      local.set 4
      block  ;; label = @2
        local.get 5
        i32.const 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 0
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        call 49
        drop
        local.get 6
        local.get 5
        local.get 0
        i32.add
        local.tee 0
        i32.add
        local.set 4
      end
      local.get 4
      i32.const 0
      i32.store8
      local.get 0
      i32.const 1
      i32.add
      local.set 4
    end
    i32.const 0
    local.get 4
    i32.store offset=1049792
    i32.const 1
    local.set 4
    local.get 1
    i32.const 1
    i32.store16 offset=92
    local.get 1
    i64.const 21474836480
    i64.store offset=84 align=4
    local.get 1
    i32.const 1
    i32.store8 offset=80
    local.get 1
    i64.const 197568495621
    i64.store offset=72 align=4
    local.get 1
    i64.const 5
    i64.store offset=64 align=4
    local.get 1
    i32.const 1048776
    i32.store offset=60
    local.get 1
    i32.const 46
    i32.store offset=56
    local.get 1
    i32.const 24
    i32.add
    local.get 1
    i32.const 56
    i32.add
    call 1
    local.get 1
    i32.load offset=24
    local.tee 5
    i32.const 1048781
    local.get 5
    select
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=28
              i32.const 1
              local.get 5
              select
              local.tee 5
              br_table 4 (;@1;) 0 (;@5;) 1 (;@4;)
            end
            local.get 0
            i32.load8_u
            i32.const -43
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;) 1 (;@3;)
          end
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 43
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 5
            i32.const 6
            i32.lt_u
            local.set 3
            local.get 5
            i32.const -1
            i32.add
            local.tee 4
            local.set 5
            local.get 3
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 5
          local.set 4
          local.get 5
          i32.const 5
          i32.ge_u
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 3
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const -48
            i32.add
            local.tee 5
            i32.const 9
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            br 3 (;@1;)
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          i32.const 10
          i32.mul
          local.get 5
          i32.add
          local.set 3
          local.get 4
          i32.const -1
          i32.add
          local.tee 4
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      local.set 7
      loop  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          local.get 7
          local.set 3
          br 2 (;@1;)
        end
        i32.const 0
        local.set 3
        local.get 0
        i32.load8_u
        i32.const -48
        i32.add
        local.tee 4
        i32.const 9
        i32.gt_u
        br_if 1 (;@1;)
        local.get 7
        i32.const 65535
        i32.and
        i32.const 10
        i32.mul
        local.tee 6
        i32.const 16
        i32.shr_u
        i32.const 0
        i32.ne
        br_if 1 (;@1;)
        local.get 6
        local.get 4
        i32.add
        local.set 7
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 5
        i32.const -1
        i32.add
        local.set 5
        local.get 6
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
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 16
    i32.add
    local.get 1
    i32.const 56
    i32.add
    call 1
    i32.const 1
    local.set 6
    local.get 1
    i32.load offset=16
    local.tee 7
    i32.const 1048781
    local.get 7
    select
    local.set 0
    i32.const 0
    local.set 5
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=20
              i32.const 1
              local.get 7
              select
              local.tee 7
              br_table 4 (;@1;) 0 (;@5;) 1 (;@4;)
            end
            i32.const 0
            local.set 4
            local.get 0
            i32.load8_u
            i32.const -43
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;) 1 (;@3;)
          end
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 43
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 7
            i32.const 6
            i32.lt_u
            local.set 4
            local.get 7
            i32.const -1
            i32.add
            local.tee 6
            local.set 7
            local.get 4
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 7
          local.set 6
          local.get 7
          i32.const 5
          i32.ge_u
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 4
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const -48
            i32.add
            local.tee 7
            i32.const 9
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            br 3 (;@1;)
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 4
          i32.const 10
          i32.mul
          local.get 7
          i32.add
          local.set 4
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      local.set 8
      loop  ;; label = @2
        block  ;; label = @3
          local.get 7
          br_if 0 (;@3;)
          local.get 8
          local.set 4
          br 2 (;@1;)
        end
        i32.const 0
        local.set 4
        local.get 0
        i32.load8_u
        i32.const -48
        i32.add
        local.tee 6
        i32.const 9
        i32.gt_u
        br_if 1 (;@1;)
        local.get 8
        i32.const 65535
        i32.and
        i32.const 10
        i32.mul
        local.tee 9
        i32.const 16
        i32.shr_u
        i32.const 0
        i32.ne
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.add
        local.set 8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 7
        i32.const -1
        i32.add
        local.set 7
        local.get 9
        i32.const 65535
        i32.and
        local.get 6
        i32.const 65535
        i32.and
        i32.add
        local.tee 6
        i32.const 65535
        i32.and
        local.get 6
        i32.eq
        br_if 0 (;@2;)
      end
    end
    local.get 1
    i32.const 8
    i32.add
    local.get 1
    i32.const 56
    i32.add
    call 1
    i32.const 1
    local.set 6
    local.get 1
    i32.load offset=8
    local.tee 7
    i32.const 1048781
    local.get 7
    select
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=12
              i32.const 1
              local.get 7
              select
              local.tee 7
              br_table 4 (;@1;) 0 (;@5;) 1 (;@4;)
            end
            local.get 0
            i32.load8_u
            i32.const -43
            i32.add
            br_table 3 (;@1;) 1 (;@3;) 3 (;@1;) 1 (;@3;)
          end
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const 43
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 7
            i32.const 6
            i32.lt_u
            local.set 5
            local.get 7
            i32.const -1
            i32.add
            local.tee 6
            local.set 7
            local.get 5
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 7
          local.set 6
          local.get 7
          i32.const 5
          i32.ge_u
          br_if 1 (;@2;)
        end
        i32.const 0
        local.set 5
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            i32.const -48
            i32.add
            local.tee 7
            i32.const 9
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            br 3 (;@1;)
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 5
          i32.const 10
          i32.mul
          local.get 7
          i32.add
          local.set 5
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      local.set 8
      loop  ;; label = @2
        block  ;; label = @3
          local.get 7
          br_if 0 (;@3;)
          local.get 8
          local.set 5
          br 2 (;@1;)
        end
        i32.const 0
        local.set 5
        local.get 0
        i32.load8_u
        i32.const -48
        i32.add
        local.tee 6
        i32.const 9
        i32.gt_u
        br_if 1 (;@1;)
        local.get 8
        i32.const 65535
        i32.and
        i32.const 10
        i32.mul
        local.tee 9
        i32.const 16
        i32.shr_u
        i32.const 0
        i32.ne
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.add
        local.set 8
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 7
        i32.const -1
        i32.add
        local.set 7
        local.get 9
        i32.const 65535
        i32.and
        local.get 6
        i32.const 65535
        i32.and
        i32.add
        local.tee 6
        i32.const 65535
        i32.and
        local.get 6
        i32.eq
        br_if 0 (;@2;)
      end
    end
    i32.const 0
    i32.load8_u offset=1049796
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                i32.const 6
                call 7
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                local.get 5
                i32.store16 offset=4
                local.get 0
                local.get 4
                i32.store16 offset=2
                local.get 0
                local.get 3
                i32.store16
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1049792
                    local.tee 3
                    i32.const 5
                    i32.le_u
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.load offset=1049784
                    local.tee 4
                    i32.const 0
                    i32.load offset=1048782 align=1
                    i32.store align=1
                    local.get 4
                    i32.const 4
                    i32.add
                    i32.const 0
                    i32.load16_u offset=1048786 align=1
                    i32.store16 align=1
                    local.get 3
                    i32.const 25
                    i32.le_u
                    br_if 1 (;@7;)
                    local.get 4
                    i64.const 0
                    i64.store offset=6 align=1
                    local.get 4
                    i32.const 22
                    i32.add
                    i32.const 0
                    i32.store align=1
                    local.get 4
                    i32.const 14
                    i32.add
                    i64.const 0
                    i64.store align=1
                    i32.const 28
                    local.set 5
                    local.get 3
                    i32.const 28
                    i32.lt_u
                    br_if 3 (;@5;)
                    local.get 4
                    local.get 0
                    i32.load16_u
                    i32.store16 offset=26 align=1
                    i32.const 30
                    local.set 5
                    local.get 3
                    i32.const 30
                    i32.lt_u
                    br_if 3 (;@5;)
                    local.get 4
                    local.get 0
                    i32.load16_u offset=2
                    i32.store16 offset=28 align=1
                    i32.const 32
                    local.set 5
                    local.get 3
                    i32.const 32
                    i32.lt_u
                    br_if 3 (;@5;)
                    local.get 4
                    local.get 0
                    i32.load16_u offset=4
                    i32.store16 offset=30 align=1
                    local.get 0
                    i32.const -4
                    i32.add
                    i32.load
                    local.tee 3
                    i32.const -8
                    i32.and
                    local.tee 5
                    i32.const 10
                    i32.const 14
                    local.get 3
                    i32.const 3
                    i32.and
                    local.tee 3
                    select
                    i32.lt_u
                    br_if 4 (;@4;)
                    block  ;; label = @9
                      local.get 3
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 5
                      i32.const 46
                      i32.ge_u
                      br_if 6 (;@3;)
                    end
                    local.get 0
                    call 8
                    block  ;; label = @9
                      local.get 1
                      i32.load offset=36
                      local.tee 0
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const -4
                      i32.add
                      i32.load
                      local.tee 3
                      i32.const -8
                      i32.and
                      local.tee 5
                      i32.const 4
                      i32.const 8
                      local.get 3
                      i32.const 3
                      i32.and
                      local.tee 3
                      select
                      local.get 0
                      i32.add
                      i32.lt_u
                      br_if 7 (;@2;)
                      block  ;; label = @10
                        local.get 3
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 5
                        local.get 0
                        i32.const 39
                        i32.add
                        i32.gt_u
                        br_if 9 (;@1;)
                      end
                      local.get 2
                      call 8
                    end
                    local.get 1
                    i32.const 96
                    i32.add
                    global.set 0
                    local.get 4
                    return
                  end
                  i32.const 6
                  local.get 3
                  i32.const 1048788
                  call 2
                  unreachable
                end
                i32.const 26
                local.get 3
                i32.const 1048804
                call 2
                unreachable
              end
              unreachable
              unreachable
            end
            local.get 5
            local.get 3
            i32.const 1048820
            call 2
            unreachable
          end
          i32.const 1049657
          i32.const 1049704
          call 9
          unreachable
        end
        i32.const 1049720
        i32.const 1049768
        call 9
        unreachable
      end
      i32.const 1049657
      i32.const 1049704
      call 9
      unreachable
    end
    i32.const 1049720
    i32.const 1049768
    call 9
    unreachable)
  (func (;4;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    local.get 1
    call 35)
  (func (;5;) (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
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
                local.get 1
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.load
                local.set 4
                local.get 3
                i32.const 3
                i32.and
                local.set 5
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.const 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 6
                    i32.const 0
                    local.set 7
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 28
                  i32.add
                  local.set 8
                  i32.const 0
                  local.set 6
                  local.get 3
                  i32.const -4
                  i32.and
                  local.tee 7
                  local.set 3
                  loop  ;; label = @8
                    local.get 8
                    i32.load
                    local.get 8
                    i32.const -8
                    i32.add
                    i32.load
                    local.get 8
                    i32.const -16
                    i32.add
                    i32.load
                    local.get 8
                    i32.const -24
                    i32.add
                    i32.load
                    local.get 6
                    i32.add
                    i32.add
                    i32.add
                    i32.add
                    local.set 6
                    local.get 8
                    i32.const 32
                    i32.add
                    local.set 8
                    local.get 3
                    i32.const -4
                    i32.add
                    local.tee 3
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.get 4
                  i32.add
                  i32.const 4
                  i32.add
                  local.set 8
                  loop  ;; label = @8
                    local.get 8
                    i32.load
                    local.get 6
                    i32.add
                    local.set 6
                    local.get 8
                    i32.const 8
                    i32.add
                    local.set 8
                    local.get 5
                    i32.const -1
                    i32.add
                    local.tee 5
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 1
                  i32.load offset=12
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 0
                  i32.lt_s
                  br_if 1 (;@6;)
                  local.get 6
                  i32.const 16
                  i32.lt_u
                  local.get 4
                  i32.load offset=4
                  i32.eqz
                  i32.and
                  br_if 1 (;@6;)
                  local.get 6
                  i32.const 1
                  i32.shl
                  local.set 6
                end
                local.get 6
                br_if 1 (;@5;)
              end
              i32.const 1
              local.set 8
              i32.const 0
              local.set 6
              br 1 (;@4;)
            end
            local.get 6
            i32.const -1
            i32.le_s
            br_if 1 (;@3;)
            i32.const 0
            i32.load8_u offset=1049796
            drop
            local.get 6
            call 7
            local.tee 8
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 2
          i32.const 0
          i32.store offset=8
          local.get 2
          local.get 8
          i32.store offset=4
          local.get 2
          local.get 6
          i32.store
          local.get 2
          i32.const 1048968
          local.get 1
          call 25
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          i32.const 15
          i32.add
          call 26
          unreachable
        end
        call 21
        unreachable
      end
      unreachable
      unreachable
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
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;6;) (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.tee 1
      local.get 0
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call 20
      unreachable
    end
    i32.const 0
    local.set 3
    i32.const 0
    i32.load offset=1049788
    local.tee 4
    i32.const 1
    i32.shl
    local.tee 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_u
    select
    local.tee 0
    i32.const 8
    local.get 0
    i32.const 8
    i32.gt_u
    select
    local.tee 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 1
    block  ;; label = @1
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 4
      i32.store offset=28
      local.get 2
      i32.const 0
      i32.load offset=1049784
      i32.store offset=20
      i32.const 1
      local.set 3
    end
    local.get 2
    local.get 3
    i32.store offset=24
    local.get 2
    i32.const 8
    i32.add
    local.get 1
    local.get 0
    local.get 2
    i32.const 20
    i32.add
    call 33
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=12
      local.get 2
      i32.load offset=16
      call 20
      unreachable
    end
    i32.const 0
    local.get 2
    i32.load offset=12
    i32.store offset=1049784
    i32.const 0
    local.get 0
    i32.store offset=1049788
    local.get 2
    i32.const 32
    i32.add
    global.set 0)
  (func (;7;) (type 4) (param i32) (result i32)
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
                    i32.load offset=1050216
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
                    i32.load offset=1050224
                    i32.le_u
                    br_if 7 (;@1;)
                    local.get 0
                    br_if 2 (;@6;)
                    i32.const 0
                    i32.load offset=1050220
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
                  i32.load offset=1050220
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
                    i32.const 1049808
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
                    i32.const 1049952
                    i32.add
                    local.tee 2
                    local.get 0
                    i32.const 1049960
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
                  i32.store offset=1050216
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
                  i32.const 1049952
                  i32.add
                  local.tee 6
                  local.get 0
                  i32.const 1049960
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
                i32.store offset=1050216
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
                i32.load offset=1050224
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.const -8
                i32.and
                i32.const 1049952
                i32.add
                local.set 6
                i32.const 0
                i32.load offset=1050232
                local.set 3
                block  ;; label = @7
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1050216
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
                    i32.store offset=1050216
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
              i32.store offset=1050232
              i32.const 0
              local.get 2
              i32.store offset=1050224
              local.get 0
              i32.const 8
              i32.add
              return
            end
            local.get 0
            i32.ctz
            i32.const 2
            i32.shl
            i32.const 1049808
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
                      i32.const 1049808
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
                    i32.load offset=1050220
                    i32.const -2
                    local.get 1
                    i32.load offset=28
                    i32.rotl
                    i32.and
                    i32.store offset=1050220
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
                  i32.load offset=1050224
                  local.tee 7
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 7
                  i32.const -8
                  i32.and
                  i32.const 1049952
                  i32.add
                  local.set 6
                  i32.const 0
                  i32.load offset=1050232
                  local.set 0
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1050216
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
                      i32.store offset=1050216
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
              i32.store offset=1050232
              i32.const 0
              local.get 3
              i32.store offset=1050224
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
            i32.const 1049808
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
        i32.load offset=1050224
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
            i32.const 1049808
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
          i32.load offset=1050220
          i32.const -2
          local.get 6
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1050220
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
            i32.const 1049808
            i32.add
            local.set 1
            block  ;; label = @5
              i32.const 0
              i32.load offset=1050220
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
              i32.load offset=1050220
              local.get 7
              i32.or
              i32.store offset=1050220
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
          i32.const 1049952
          i32.add
          local.set 0
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1050216
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
              i32.store offset=1050216
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
                  i32.load offset=1050224
                  local.tee 0
                  local.get 2
                  i32.ge_u
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1050228
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
                    i32.load offset=1050240
                    i32.const 0
                    local.get 6
                    i32.const -65536
                    i32.and
                    local.get 7
                    select
                    local.tee 8
                    i32.add
                    local.tee 0
                    i32.store offset=1050240
                    i32.const 0
                    i32.const 0
                    i32.load offset=1050244
                    local.tee 3
                    local.get 0
                    local.get 3
                    local.get 0
                    i32.gt_u
                    select
                    i32.store offset=1050244
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1050236
                          local.tee 3
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 1049936
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
                            i32.load offset=1050252
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
                          i32.store offset=1050252
                        end
                        i32.const 0
                        i32.const 4095
                        i32.store offset=1050256
                        i32.const 0
                        local.get 8
                        i32.store offset=1049940
                        i32.const 0
                        local.get 1
                        i32.store offset=1049936
                        i32.const 0
                        i32.const 1049952
                        i32.store offset=1049964
                        i32.const 0
                        i32.const 1049960
                        i32.store offset=1049972
                        i32.const 0
                        i32.const 1049952
                        i32.store offset=1049960
                        i32.const 0
                        i32.const 1049968
                        i32.store offset=1049980
                        i32.const 0
                        i32.const 1049960
                        i32.store offset=1049968
                        i32.const 0
                        i32.const 1049976
                        i32.store offset=1049988
                        i32.const 0
                        i32.const 1049968
                        i32.store offset=1049976
                        i32.const 0
                        i32.const 1049984
                        i32.store offset=1049996
                        i32.const 0
                        i32.const 1049976
                        i32.store offset=1049984
                        i32.const 0
                        i32.const 1049992
                        i32.store offset=1050004
                        i32.const 0
                        i32.const 1049984
                        i32.store offset=1049992
                        i32.const 0
                        i32.const 1050000
                        i32.store offset=1050012
                        i32.const 0
                        i32.const 1049992
                        i32.store offset=1050000
                        i32.const 0
                        i32.const 1050008
                        i32.store offset=1050020
                        i32.const 0
                        i32.const 1050000
                        i32.store offset=1050008
                        i32.const 0
                        i32.const 0
                        i32.store offset=1049948
                        i32.const 0
                        i32.const 1050016
                        i32.store offset=1050028
                        i32.const 0
                        i32.const 1050008
                        i32.store offset=1050016
                        i32.const 0
                        i32.const 1050016
                        i32.store offset=1050024
                        i32.const 0
                        i32.const 1050024
                        i32.store offset=1050036
                        i32.const 0
                        i32.const 1050024
                        i32.store offset=1050032
                        i32.const 0
                        i32.const 1050032
                        i32.store offset=1050044
                        i32.const 0
                        i32.const 1050032
                        i32.store offset=1050040
                        i32.const 0
                        i32.const 1050040
                        i32.store offset=1050052
                        i32.const 0
                        i32.const 1050040
                        i32.store offset=1050048
                        i32.const 0
                        i32.const 1050048
                        i32.store offset=1050060
                        i32.const 0
                        i32.const 1050048
                        i32.store offset=1050056
                        i32.const 0
                        i32.const 1050056
                        i32.store offset=1050068
                        i32.const 0
                        i32.const 1050056
                        i32.store offset=1050064
                        i32.const 0
                        i32.const 1050064
                        i32.store offset=1050076
                        i32.const 0
                        i32.const 1050064
                        i32.store offset=1050072
                        i32.const 0
                        i32.const 1050072
                        i32.store offset=1050084
                        i32.const 0
                        i32.const 1050072
                        i32.store offset=1050080
                        i32.const 0
                        i32.const 1050080
                        i32.store offset=1050092
                        i32.const 0
                        i32.const 1050088
                        i32.store offset=1050100
                        i32.const 0
                        i32.const 1050080
                        i32.store offset=1050088
                        i32.const 0
                        i32.const 1050096
                        i32.store offset=1050108
                        i32.const 0
                        i32.const 1050088
                        i32.store offset=1050096
                        i32.const 0
                        i32.const 1050104
                        i32.store offset=1050116
                        i32.const 0
                        i32.const 1050096
                        i32.store offset=1050104
                        i32.const 0
                        i32.const 1050112
                        i32.store offset=1050124
                        i32.const 0
                        i32.const 1050104
                        i32.store offset=1050112
                        i32.const 0
                        i32.const 1050120
                        i32.store offset=1050132
                        i32.const 0
                        i32.const 1050112
                        i32.store offset=1050120
                        i32.const 0
                        i32.const 1050128
                        i32.store offset=1050140
                        i32.const 0
                        i32.const 1050120
                        i32.store offset=1050128
                        i32.const 0
                        i32.const 1050136
                        i32.store offset=1050148
                        i32.const 0
                        i32.const 1050128
                        i32.store offset=1050136
                        i32.const 0
                        i32.const 1050144
                        i32.store offset=1050156
                        i32.const 0
                        i32.const 1050136
                        i32.store offset=1050144
                        i32.const 0
                        i32.const 1050152
                        i32.store offset=1050164
                        i32.const 0
                        i32.const 1050144
                        i32.store offset=1050152
                        i32.const 0
                        i32.const 1050160
                        i32.store offset=1050172
                        i32.const 0
                        i32.const 1050152
                        i32.store offset=1050160
                        i32.const 0
                        i32.const 1050168
                        i32.store offset=1050180
                        i32.const 0
                        i32.const 1050160
                        i32.store offset=1050168
                        i32.const 0
                        i32.const 1050176
                        i32.store offset=1050188
                        i32.const 0
                        i32.const 1050168
                        i32.store offset=1050176
                        i32.const 0
                        i32.const 1050184
                        i32.store offset=1050196
                        i32.const 0
                        i32.const 1050176
                        i32.store offset=1050184
                        i32.const 0
                        i32.const 1050192
                        i32.store offset=1050204
                        i32.const 0
                        i32.const 1050184
                        i32.store offset=1050192
                        i32.const 0
                        i32.const 1050200
                        i32.store offset=1050212
                        i32.const 0
                        i32.const 1050192
                        i32.store offset=1050200
                        i32.const 0
                        local.get 1
                        i32.store offset=1050236
                        i32.const 0
                        i32.const 1050200
                        i32.store offset=1050208
                        i32.const 0
                        local.get 8
                        i32.const -40
                        i32.add
                        local.tee 0
                        i32.store offset=1050228
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
                        i32.store offset=1050248
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
                    i32.load offset=1050252
                    local.tee 0
                    local.get 1
                    local.get 0
                    local.get 1
                    i32.lt_u
                    select
                    i32.store offset=1050252
                    local.get 1
                    local.get 8
                    i32.add
                    local.set 6
                    i32.const 1049936
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
                      i32.const 1049936
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
                      i32.store offset=1050236
                      i32.const 0
                      local.get 8
                      i32.const -40
                      i32.add
                      local.tee 0
                      i32.store offset=1050228
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
                      i32.store offset=1050248
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
                      i64.load offset=1049936 align=4
                      local.set 9
                      local.get 7
                      i32.const 16
                      i32.add
                      i32.const 0
                      i64.load offset=1049944 align=4
                      i64.store align=4
                      local.get 7
                      local.get 9
                      i64.store offset=8 align=4
                      i32.const 0
                      local.get 8
                      i32.store offset=1049940
                      i32.const 0
                      local.get 1
                      i32.store offset=1049936
                      i32.const 0
                      local.get 7
                      i32.const 8
                      i32.add
                      i32.store offset=1049944
                      i32.const 0
                      i32.const 0
                      i32.store offset=1049948
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
                        call 41
                        br 8 (;@2;)
                      end
                      local.get 0
                      i32.const -8
                      i32.and
                      i32.const 1049952
                      i32.add
                      local.set 6
                      block  ;; label = @10
                        block  ;; label = @11
                          i32.const 0
                          i32.load offset=1050216
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
                          i32.store offset=1050216
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
                    i32.load offset=1050236
                    i32.eq
                    br_if 3 (;@5;)
                    local.get 6
                    i32.const 0
                    i32.load offset=1050232
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
                      call 41
                      br 6 (;@3;)
                    end
                    local.get 3
                    i32.const -8
                    i32.and
                    i32.const 1049952
                    i32.add
                    local.set 2
                    block  ;; label = @9
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1050216
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
                        i32.store offset=1050216
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
                  i32.store offset=1050228
                  i32.const 0
                  i32.const 0
                  i32.load offset=1050236
                  local.tee 0
                  local.get 2
                  i32.add
                  local.tee 6
                  i32.store offset=1050236
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
                i32.load offset=1050232
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
                    i32.store offset=1050232
                    i32.const 0
                    i32.const 0
                    i32.store offset=1050224
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
                  i32.store offset=1050224
                  i32.const 0
                  local.get 3
                  local.get 2
                  i32.add
                  local.tee 1
                  i32.store offset=1050232
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
              i32.load offset=1050236
              local.tee 0
              i32.const 15
              i32.add
              i32.const -8
              i32.and
              local.tee 3
              i32.const -8
              i32.add
              local.tee 6
              i32.store offset=1050236
              i32.const 0
              local.get 0
              local.get 3
              i32.sub
              i32.const 0
              i32.load offset=1050228
              local.get 8
              i32.add
              local.tee 3
              i32.add
              i32.const 8
              i32.add
              local.tee 1
              i32.store offset=1050228
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
              i32.store offset=1050248
              br 3 (;@2;)
            end
            i32.const 0
            local.get 0
            i32.store offset=1050236
            i32.const 0
            i32.const 0
            i32.load offset=1050228
            local.get 3
            i32.add
            local.tee 3
            i32.store offset=1050228
            local.get 0
            local.get 3
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          i32.const 0
          local.get 0
          i32.store offset=1050232
          i32.const 0
          i32.const 0
          i32.load offset=1050224
          local.get 3
          i32.add
          local.tee 3
          i32.store offset=1050224
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
      i32.load offset=1050228
      local.tee 3
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      local.get 3
      local.get 2
      i32.sub
      local.tee 3
      i32.store offset=1050228
      i32.const 0
      i32.const 0
      i32.load offset=1050236
      local.tee 0
      local.get 2
      i32.add
      local.tee 6
      i32.store offset=1050236
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
  (func (;8;) (type 5) (param i32)
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
          i32.load offset=1050232
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
          i32.store offset=1050224
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
                      i32.load offset=1050236
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 3
                      i32.const 0
                      i32.load offset=1050232
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
                      i32.load offset=1050232
                      i32.ne
                      br_if 1 (;@8;)
                      i32.const 0
                      local.get 0
                      i32.store offset=1050224
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
                  i32.const 1049808
                  i32.add
                  local.set 2
                  i32.const 0
                  i32.load offset=1050220
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
                  i32.load offset=1050220
                  local.get 4
                  i32.or
                  i32.store offset=1050220
                  br 4 (;@3;)
                end
                i32.const 0
                local.get 1
                i32.store offset=1050236
                i32.const 0
                i32.const 0
                i32.load offset=1050228
                local.get 0
                i32.add
                local.tee 0
                i32.store offset=1050228
                local.get 1
                local.get 0
                i32.const 1
                i32.or
                i32.store offset=4
                block  ;; label = @7
                  local.get 1
                  i32.const 0
                  i32.load offset=1050232
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1050224
                  i32.const 0
                  i32.const 0
                  i32.store offset=1050232
                end
                local.get 0
                i32.const 0
                i32.load offset=1050248
                local.tee 4
                i32.le_u
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1050236
                local.tee 0
                i32.eqz
                br_if 5 (;@1;)
                i32.const 0
                local.set 2
                i32.const 0
                i32.load offset=1050228
                local.tee 5
                i32.const 41
                i32.lt_u
                br_if 4 (;@2;)
                i32.const 1049936
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
              i32.store offset=1050232
              i32.const 0
              i32.const 0
              i32.load offset=1050224
              local.get 0
              i32.add
              local.tee 0
              i32.store offset=1050224
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
            i32.const 1049952
            i32.add
            local.set 3
            block  ;; label = @5
              block  ;; label = @6
                i32.const 0
                i32.load offset=1050216
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
                i32.store offset=1050216
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
        i32.load offset=1050256
        i32.const -1
        i32.add
        local.tee 0
        i32.store offset=1050256
        local.get 0
        br_if 1 (;@1;)
        block  ;; label = @3
          i32.const 0
          i32.load offset=1049944
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
        i32.store offset=1050256
        return
      end
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049944
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
      i32.store offset=1050256
      local.get 5
      local.get 4
      i32.le_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const -1
      i32.store offset=1050248
    end)
  (func (;9;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 0
    i32.store offset=16
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i64.const 4
    i64.store offset=8 align=4
    local.get 2
    i32.const 46
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store
    local.get 2
    local.get 1
    call 22
    unreachable)
  (func (;10;) (type 4) (param i32) (result i32)
    (local i32 i32 i32 i64 i32 i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 1
    global.set 0
    local.get 0
    i32.const 2
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const -3
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.load offset=1049792
            local.tee 3
            i32.gt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 0
            i32.load offset=1049784
            local.get 0
            i32.add
            i32.load16_u align=1
            local.tee 0
            i32.store16 offset=10
            block  ;; label = @5
              local.get 0
              i32.const 7
              i32.eq
              br_if 0 (;@5;)
              local.get 1
              i32.const 2
              i32.store offset=28
              local.get 1
              i32.const 1048892
              i32.store offset=24
              local.get 1
              i64.const 2
              i64.store offset=36 align=4
              local.get 1
              i32.const 2
              i64.extend_i32_u
              i64.const 32
              i64.shl
              local.tee 4
              i32.const 1048836
              i64.extend_i32_u
              i64.or
              i64.store offset=56
              local.get 1
              local.get 4
              local.get 1
              i32.const 10
              i32.add
              i64.extend_i32_u
              i64.or
              i64.store offset=48
              local.get 1
              local.get 1
              i32.const 48
              i32.add
              i32.store offset=32
              local.get 1
              i32.const 12
              i32.add
              local.get 1
              i32.const 24
              i32.add
              call 5
              i32.const 2
              local.get 1
              i32.load offset=16
              local.tee 2
              local.get 1
              i32.load offset=20
              call 0
              local.get 1
              i32.load offset=12
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.const -4
              i32.add
              i32.load
              local.tee 5
              i32.const -8
              i32.and
              local.tee 6
              i32.const 4
              i32.const 8
              local.get 5
              i32.const 3
              i32.and
              local.tee 5
              select
              local.get 3
              i32.add
              i32.lt_u
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 5
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                local.get 3
                i32.const 39
                i32.add
                i32.gt_u
                br_if 5 (;@1;)
              end
              local.get 2
              call 8
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
          local.get 0
          local.get 2
          i32.const 1048700
          call 12
          unreachable
        end
        local.get 2
        local.get 3
        i32.const 1048700
        call 2
        unreachable
      end
      i32.const 1049657
      i32.const 1049704
      call 9
      unreachable
    end
    i32.const 1049720
    i32.const 1049768
    call 9
    unreachable)
  (func (;11;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i64.load16_u
    local.get 1
    call 35)
  (func (;12;) (type 3) (param i32 i32 i32)
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
    i32.const 1049600
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
    call 22
    unreachable)
  (func (;13;) (type 5) (param i32)
    i64.const 41
    call 14
    drop)
  (func (;14;) (type 6) (param i64) (result i64)
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
        call 14
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
  (func (;15;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 8
            i32.add
            local.tee 2
            i32.const 0
            i32.load offset=1049792
            local.tee 3
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            local.get 0
            i32.lt_u
            br_if 2 (;@2;)
            local.get 3
            local.get 0
            i32.le_u
            br_if 1 (;@3;)
            block  ;; label = @5
              i32.const 0
              i32.load offset=1049784
              local.tee 3
              local.get 0
              i32.add
              i64.load8_u
              local.tee 4
              i64.const 93
              i64.gt_u
              br_if 0 (;@5;)
              local.get 4
              call 14
              local.set 4
              local.get 1
              i32.const -8
              i32.ge_u
              br_if 4 (;@1;)
              local.get 3
              local.get 1
              i32.add
              local.get 4
              i64.store align=1
              i32.const 1
              return
            end
            i32.const 2
            i32.const 1048908
            i32.const 18
            call 0
            i32.const 0
            return
          end
          i32.const 2
          i32.const 1048940
          i32.const 21
          call 0
          i32.const 0
          return
        end
        local.get 0
        local.get 3
        call 16
        unreachable
      end
      i32.const 2
      i32.const 1048926
      i32.const 14
      call 0
      i32.const 0
      return
    end
    local.get 1
    local.get 2
    i32.const 1048716
    call 12
    unreachable)
  (func (;16;) (type 2) (param i32 i32)
    (local i32 i64)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 2
    i32.store offset=12
    local.get 2
    i32.const 1049260
    i32.store offset=8
    local.get 2
    i64.const 2
    i64.store offset=20 align=4
    local.get 2
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 3
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    local.get 3
    local.get 2
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048684
    call 22
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
                      i32.load offset=1050236
                      i32.eq
                      br_if 3 (;@6;)
                      local.get 6
                      i32.const 0
                      i32.load offset=1050232
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
                i32.load offset=1050224
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
                i32.store offset=1050232
                i32.const 0
                local.get 2
                i32.store offset=1050224
                local.get 0
                return
              end
              i32.const 0
              i32.load offset=1050228
              local.get 5
              i32.add
              local.tee 5
              local.get 1
              i32.gt_u
              br_if 4 (;@1;)
            end
            block  ;; label = @5
              local.get 2
              call 7
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
            call 51
            local.set 2
            local.get 0
            call 8
            local.get 2
            local.set 0
          end
          local.get 0
          return
        end
        i32.const 1049657
        i32.const 1049704
        call 9
        unreachable
      end
      i32.const 1049720
      i32.const 1049768
      call 9
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
    i32.store offset=1050228
    i32.const 0
    local.get 2
    i32.store offset=1050236
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
            i32.const 1049808
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
          i32.load offset=1050220
          i32.const -2
          local.get 0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1050220
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
        i32.load offset=1050216
        i32.const -2
        local.get 1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1050216
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
          i32.load offset=1050232
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
          i32.store offset=1050224
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
              i32.load offset=1050236
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.load offset=1050232
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
              i32.load offset=1050232
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 1
              i32.store offset=1050224
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
            i32.const 1049808
            i32.add
            local.set 3
            block  ;; label = @5
              i32.const 0
              i32.load offset=1050220
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
              i32.load offset=1050220
              local.get 4
              i32.or
              i32.store offset=1050220
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
          i32.const 1049952
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1050216
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
              i32.store offset=1050216
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
        i32.store offset=1050236
        i32.const 0
        i32.const 0
        i32.load offset=1050228
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=1050228
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 0
        i32.load offset=1050232
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store offset=1050224
        i32.const 0
        i32.const 0
        i32.store offset=1050232
        return
      end
      i32.const 0
      local.get 0
      i32.store offset=1050232
      i32.const 0
      i32.const 0
      i32.load offset=1050224
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1050224
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
  (func (;20;) (type 2) (param i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      call 21
      unreachable
    end
    unreachable
    unreachable)
  (func (;21;) (type 7)
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
    i32.const 1049012
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1049048
    call 22
    unreachable)
  (func (;22;) (type 2) (param i32 i32)
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
    call 34
    unreachable)
  (func (;23;) (type 3) (param i32 i32 i32)
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
      call 20
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
    call 24
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=16
      call 20
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
  (func (;24;) (type 8) (param i32 i32 i32 i32)
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
              i32.load8_u offset=1049796
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
          i32.load8_u offset=1049796
          drop
        end
        local.get 2
        call 7
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
  (func (;25;) (type 0) (param i32 i32 i32) (result i32)
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
  (func (;26;) (type 5) (param i32)
    (local i32)
    global.get 0
    i32.const 64
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    i32.const 86
    i32.store offset=12
    local.get 1
    i32.const 1049080
    i32.store offset=8
    local.get 1
    i32.const 1049064
    i32.store offset=20
    local.get 1
    local.get 0
    i32.store offset=16
    local.get 1
    i32.const 2
    i32.store offset=28
    local.get 1
    i32.const 1049280
    i32.store offset=24
    local.get 1
    i64.const 2
    i64.store offset=36 align=4
    local.get 1
    i32.const 3
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 1
    i32.const 4
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 1
    local.get 1
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 1
    i32.const 24
    i32.add
    i32.const 1049192
    call 22
    unreachable)
  (func (;27;) (type 1) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1048961
    i32.const 5
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 0))
  (func (;28;) (type 5) (param i32)
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
          call 8
        end
        return
      end
      i32.const 1049657
      i32.const 1049704
      call 9
      unreachable
    end
    i32.const 1049720
    i32.const 1049768
    call 9
    unreachable)
  (func (;29;) (type 0) (param i32 i32 i32) (result i32)
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
      call 23
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
    call 51
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func (;30;) (type 1) (param i32 i32) (result i32)
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
            call 31
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
        call 23
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
      call 51
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
  (func (;31;) (type 5) (param i32)
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
      call 20
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
    call 24
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=16
      call 20
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
  (func (;32;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.const 1048968
    local.get 1
    call 25)
  (func (;33;) (type 8) (param i32 i32 i32 i32)
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
              i32.load8_u offset=1049796
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
          i32.load8_u offset=1049796
          drop
        end
        local.get 2
        call 7
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
  (func (;34;) (type 5) (param i32)
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
    call 42
    unreachable)
  (func (;35;) (type 9) (param i64 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
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
        i32.const 1049296
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
        i32.const 1049296
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
      i32.const 1049296
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
        i32.const 1049296
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
    i32.const 39
    local.get 3
    i32.sub
    local.set 8
    i32.const 1
    local.set 7
    i32.const 43
    i32.const 1114112
    local.get 1
    i32.load offset=28
    local.tee 5
    i32.const 1
    i32.and
    local.tee 6
    select
    local.set 9
    local.get 5
    i32.const 4
    i32.and
    i32.const 2
    i32.shr_u
    local.set 10
    local.get 2
    i32.const 9
    i32.add
    local.get 3
    i32.add
    local.set 11
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=24
        local.tee 5
        local.get 9
        local.get 10
        call 36
        br_if 1 (;@1;)
        local.get 3
        local.get 11
        local.get 8
        local.get 5
        i32.load offset=12
        call_indirect (type 0)
        local.set 7
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 12
        local.get 6
        local.get 8
        i32.add
        local.tee 7
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 7
        local.get 1
        i32.load offset=20
        local.tee 3
        local.get 1
        i32.load offset=24
        local.tee 5
        local.get 9
        local.get 10
        call 36
        br_if 1 (;@1;)
        local.get 3
        local.get 11
        local.get 8
        local.get 5
        i32.load offset=12
        call_indirect (type 0)
        local.set 7
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 5
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=16
        local.set 13
        local.get 1
        i32.const 48
        i32.store offset=16
        local.get 1
        i32.load8_u offset=32
        local.set 14
        i32.const 1
        local.set 7
        local.get 1
        i32.const 1
        i32.store8 offset=32
        local.get 1
        i32.load offset=20
        local.tee 5
        local.get 1
        i32.load offset=24
        local.tee 15
        local.get 9
        local.get 10
        call 36
        br_if 1 (;@1;)
        local.get 3
        local.get 12
        i32.add
        local.get 6
        i32.sub
        i32.const -38
        i32.add
        local.set 3
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            i32.const -1
            i32.add
            local.tee 3
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.const 48
            local.get 15
            i32.load offset=16
            call_indirect (type 1)
            i32.eqz
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 5
        local.get 11
        local.get 8
        local.get 15
        i32.load offset=12
        call_indirect (type 0)
        br_if 1 (;@1;)
        local.get 1
        local.get 14
        i32.store8 offset=32
        local.get 1
        local.get 13
        i32.store offset=16
        i32.const 0
        local.set 7
        br 1 (;@1;)
      end
      local.get 12
      local.get 7
      i32.sub
      local.set 12
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load8_u offset=32
            local.tee 3
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 12
          local.set 3
          i32.const 0
          local.set 12
          br 1 (;@2;)
        end
        local.get 12
        i32.const 1
        i32.shr_u
        local.set 3
        local.get 12
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 12
      end
      local.get 3
      i32.const 1
      i32.add
      local.set 3
      local.get 1
      i32.load offset=16
      local.set 15
      local.get 1
      i32.load offset=24
      local.set 5
      local.get 1
      i32.load offset=20
      local.set 6
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          i32.const -1
          i32.add
          local.tee 3
          i32.eqz
          br_if 1 (;@2;)
          local.get 6
          local.get 15
          local.get 5
          i32.load offset=16
          call_indirect (type 1)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        local.set 7
        br 1 (;@1;)
      end
      i32.const 1
      local.set 7
      local.get 6
      local.get 5
      local.get 9
      local.get 10
      call 36
      br_if 0 (;@1;)
      local.get 6
      local.get 11
      local.get 8
      local.get 5
      i32.load offset=12
      call_indirect (type 0)
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      loop  ;; label = @2
        block  ;; label = @3
          local.get 12
          local.get 3
          i32.ne
          br_if 0 (;@3;)
          local.get 12
          local.get 12
          i32.lt_u
          local.set 7
          br 2 (;@1;)
        end
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        local.get 6
        local.get 15
        local.get 5
        i32.load offset=16
        call_indirect (type 1)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 3
      i32.const -1
      i32.add
      local.get 12
      i32.lt_u
      local.set 7
    end
    local.get 2
    i32.const 48
    i32.add
    global.set 0
    local.get 7)
  (func (;36;) (type 10) (param i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 4
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
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    local.get 3
    i32.const 0
    local.get 1
    i32.load offset=12
    call_indirect (type 0))
  (func (;37;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 4
          local.get 1
          i32.load offset=8
          local.tee 0
          i32.or
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            local.get 2
            i32.add
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=12
                local.tee 6
                br_if 0 (;@6;)
                i32.const 0
                local.set 7
                local.get 3
                local.set 8
                br 1 (;@5;)
              end
              i32.const 0
              local.set 7
              i32.const 0
              local.set 9
              local.get 3
              local.set 8
              loop  ;; label = @6
                local.get 8
                local.tee 0
                local.get 5
                i32.eq
                br_if 2 (;@4;)
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load8_s
                    local.tee 8
                    i32.const -1
                    i32.le_s
                    br_if 0 (;@8;)
                    local.get 0
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
                    local.get 0
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
                    local.get 0
                    i32.const 3
                    i32.add
                    local.set 8
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 8
                end
                local.get 8
                local.get 0
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
              local.tee 0
              i32.const -1
              i32.gt_s
              br_if 0 (;@5;)
              local.get 0
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
                  local.set 0
                  local.get 3
                  local.get 7
                  i32.add
                  i32.load8_s
                  i32.const -65
                  i32.gt_s
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 0
                local.set 0
                local.get 7
                local.get 2
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 3
              local.set 0
            end
            local.get 7
            local.get 2
            local.get 0
            select
            local.set 2
            local.get 0
            local.get 3
            local.get 0
            select
            local.set 3
          end
          block  ;; label = @4
            local.get 4
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=20
            local.get 3
            local.get 2
            local.get 1
            i32.load offset=24
            i32.load offset=12
            call_indirect (type 0)
            return
          end
          local.get 1
          i32.load offset=4
          local.set 10
          block  ;; label = @4
            local.get 2
            i32.const 16
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            local.get 3
            local.get 3
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
            local.set 4
            i32.const 0
            local.set 6
            i32.const 0
            local.set 0
            block  ;; label = @5
              local.get 3
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              local.set 0
              block  ;; label = @6
                local.get 9
                i32.const -4
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                local.set 0
                i32.const 0
                local.set 5
                loop  ;; label = @7
                  local.get 0
                  local.get 3
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
                  local.set 0
                  local.get 5
                  i32.const 4
                  i32.add
                  local.tee 5
                  br_if 0 (;@7;)
                end
              end
              local.get 3
              local.set 8
              loop  ;; label = @6
                local.get 0
                local.get 8
                i32.load8_s
                i32.const -65
                i32.gt_s
                i32.add
                local.set 0
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
              local.get 4
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
              local.get 4
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
              local.get 4
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
            local.get 0
            i32.add
            local.set 6
            loop  ;; label = @5
              local.get 7
              local.set 4
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
                local.get 4
                local.get 13
                i32.const 1008
                i32.and
                i32.add
                local.set 9
                i32.const 0
                local.set 8
                local.get 4
                local.set 0
                loop  ;; label = @7
                  local.get 0
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
                  local.get 0
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
                  local.get 0
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
                  local.get 0
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
                  local.get 0
                  i32.const 16
                  i32.add
                  local.tee 0
                  local.get 9
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 5
              local.get 11
              i32.sub
              local.set 5
              local.get 4
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
            local.get 4
            local.get 11
            i32.const 252
            i32.and
            i32.const 2
            i32.shl
            i32.add
            local.tee 8
            i32.load
            local.tee 0
            i32.const -1
            i32.xor
            i32.const 7
            i32.shr_u
            local.get 0
            i32.const 6
            i32.shr_u
            i32.or
            i32.const 16843009
            i32.and
            local.set 0
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
            local.get 0
            i32.add
            local.set 0
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
            local.get 0
            i32.add
            local.set 0
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
              local.set 0
              br 1 (;@4;)
            end
            local.get 3
            i32.load8_s
            i32.const -65
            i32.gt_s
            local.get 3
            i32.load8_s offset=1
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=2
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=3
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 2
            i32.const 12
            i32.and
            local.tee 0
            i32.const 4
            i32.eq
            br_if 0 (;@4;)
            local.get 6
            local.get 3
            i32.load8_s offset=4
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=5
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=6
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=7
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 0
            i32.const 8
            i32.eq
            br_if 0 (;@4;)
            local.get 6
            local.get 3
            i32.load8_s offset=8
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=9
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=10
            i32.const -65
            i32.gt_s
            i32.add
            local.get 3
            i32.load8_s offset=11
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
          end
          local.get 8
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          local.get 0
          i32.add
          local.set 0
          loop  ;; label = @4
            local.get 6
            local.get 0
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 6
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 8
            i32.const -1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 1
        i32.load offset=20
        local.get 3
        local.get 2
        local.get 1
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 0)
        return
      end
      local.get 0
      i32.const 8
      i32.shr_u
      i32.const 459007
      i32.and
      local.get 0
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
        local.set 0
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load8_u offset=32
              br_table 2 (;@3;) 0 (;@5;) 1 (;@4;) 2 (;@3;) 2 (;@3;)
            end
            local.get 5
            local.set 0
            i32.const 0
            local.set 5
            br 1 (;@3;)
          end
          local.get 5
          i32.const 1
          i32.shr_u
          local.set 0
          local.get 5
          i32.const 1
          i32.add
          i32.const 1
          i32.shr_u
          local.set 5
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.load offset=16
        local.set 9
        local.get 1
        i32.load offset=24
        local.set 8
        local.get 1
        i32.load offset=20
        local.set 7
        loop  ;; label = @3
          local.get 0
          i32.const -1
          i32.add
          local.tee 0
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
      local.get 1
      i32.load offset=20
      local.get 3
      local.get 2
      local.get 1
      i32.load offset=24
      i32.load offset=12
      call_indirect (type 0)
      return
    end
    i32.const 1
    local.set 0
    block  ;; label = @1
      local.get 7
      local.get 3
      local.get 2
      local.get 8
      i32.load offset=12
      call_indirect (type 0)
      br_if 0 (;@1;)
      i32.const 0
      local.set 0
      block  ;; label = @2
        loop  ;; label = @3
          block  ;; label = @4
            local.get 5
            local.get 0
            i32.ne
            br_if 0 (;@4;)
            local.get 5
            local.set 0
            br 2 (;@2;)
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 7
          local.get 9
          local.get 8
          i32.load offset=16
          call_indirect (type 1)
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 0
        i32.const -1
        i32.add
        local.set 0
      end
      local.get 0
      local.get 5
      i32.lt_u
      local.set 0
    end
    local.get 0)
  (func (;38;) (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 1))
  (func (;39;) (type 7)
    unreachable
    unreachable)
  (func (;40;) (type 2) (param i32 i32)
    local.get 0
    i32.const 0
    i32.store)
  (func (;41;) (type 2) (param i32 i32)
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
    i32.const 1049808
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1050220
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
      i32.load offset=1050220
      local.get 4
      i32.or
      i32.store offset=1050220
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
  (func (;42;) (type 5) (param i32)
    local.get 0
    call 43
    unreachable)
  (func (;43;) (type 5) (param i32)
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
      i32.const 5
      local.get 0
      i32.load offset=28
      local.tee 0
      i32.load8_u offset=28
      local.get 0
      i32.load8_u offset=29
      call 44
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 6
    local.get 0
    i32.load offset=28
    local.tee 0
    i32.load8_u offset=28
    local.get 0
    i32.load8_u offset=29
    call 44
    unreachable)
  (func (;44;) (type 8) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    i32.const 0
    i32.const 0
    i32.load offset=1049804
    local.tee 5
    i32.const 1
    i32.add
    i32.store offset=1049804
    block  ;; label = @1
      local.get 5
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load8_u offset=1050264
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1050260
          i32.const 1
          i32.add
          i32.store offset=1050260
          i32.const 0
          i32.load offset=1049800
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
      i32.store8 offset=1050264
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      call 39
      unreachable
    end
    unreachable
    unreachable)
  (func (;45;) (type 2) (param i32 i32)
    local.get 0
    local.get 1
    i64.load align=4
    i64.store)
  (func (;46;) (type 0) (param i32 i32 i32) (result i32)
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
  (func (;47;) (type 0) (param i32 i32 i32) (result i32)
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
  (func (;48;) (type 0) (param i32 i32 i32) (result i32)
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
  (func (;49;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 47)
  (func (;50;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 48)
  (func (;51;) (type 0) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call 46)
  (table (;0;) 12 12 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1050265))
  (global (;2;) i32 (i32.const 1050272))
  (export "memory" (memory 0))
  (export "setup" (func 3))
  (export "receiveGameParams" (func 10))
  (export "tick" (func 13))
  (export "runFib" (func 15))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func 4 11 38 37 40 45 28 29 30 32 27)
  (data (;0;) (i32.const 1048576) "/rustc/eeb90cda1969383f56a2637cbd3037bdf598841c/library/core/src/str/pattern.rs\00\00\00\10\00O\00\00\00\bf\01\00\007\00\00\00src/lib.rs\00\00`\00\10\00\0a\00\00\00\12\00\00\00\1c\00\00\00`\00\10\00\0a\00\00\00\18\00\00\00*\00\00\00`\00\10\00\0a\00\00\00\1f\00\00\00\15\00\00\00Reserving space for  bytes.\00\9c\00\10\00\14\00\00\00\b0\00\10\00\07\00\00\000.1.00bot_rs`\00\10\00\0a\00\00\00=\00\00\00\15\00\00\00`\00\10\00\0a\00\00\00>\00\00\00\15\00\00\00`\00\10\00\0a\00\00\00D\00\00\00\19\00\00\00\07\00ERROR: Can't parse GameParams v; only prepared for v\00\00\06\01\10\00\1f\00\00\00%\01\10\00\15\00\00\00Fib index too highInvalid offsetInvalid result offsetError\00\00\07\00\00\00\0c\00\00\00\04\00\00\00\08\00\00\00\09\00\00\00\0a\00\00\00capacity overflow\00\00\00\a0\01\10\00\11\00\00\00library/alloc/src/raw_vec.rs\bc\01\10\00\1c\00\00\00\19\00\00\00\05\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\0b\00\00\00a formatting trait implementation returned an error when the underlying stream did notlibrary/alloc/src/fmt.rs\00\00N\02\10\00\18\00\00\00\7f\02\00\00\0e\00\00\00index out of bounds: the len is  but the index is \00\00x\02\10\00 \00\00\00\98\02\10\00\12\00\00\00: \00\00\01\00\00\00\00\00\00\00\bc\02\10\00\02\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899 out of range for slice of length range end index \00\00\ba\03\10\00\10\00\00\00\98\03\10\00\22\00\00\00slice index starts at  but ends at \00\dc\03\10\00\16\00\00\00\f2\03\10\00\0d\00\00\00/rust/deps/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00\10\04\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\10\04\10\00)\00\00\00\ae\04\00\00\0d\00\00\00")
  (data (;1;) (i32.const 1049784) "\01\00\00\00"))
