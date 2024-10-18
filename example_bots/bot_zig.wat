(module
  (type (;0;) (func (param i32 i32 i32 i32)))
  (type (;1;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (param i32 i32 i32)))
  (type (;5;) (func))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (type (;7;) (func (param i64) (result i64)))
  (type (;8;) (func (param i32) (result i32)))
  (type (;9;) (func (param i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32)))
  (import "env" "logFunction" (func (;0;) (type 4)))
  (func (;1;) (type 5)
    i32.const 0
    i32.const 1
    i32.store offset=1049304
    i32.const 0
    i32.const 2
    i32.store offset=1049288)
  (func (;2;) (type 2) (param i32)
    (local i32 i64 i64 i64 i32)
    global.get 0
    i32.const 160
    i32.sub
    local.tee 1
    global.set 0
    block  ;; label = @1
      local.get 0
      i32.const 250
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i64.load offset=1049296
      i64.const 1
      i64.add
      local.tee 2
      i64.store offset=1049296
      local.get 1
      i32.const 3
      i32.store offset=68
      local.get 1
      i64.const 45
      i64.store offset=52 align=4
      local.get 1
      local.get 1
      i32.const 60
      i32.add
      i32.store offset=64
      local.get 1
      local.get 1
      i32.const 48
      i32.add
      i32.store offset=60
      local.get 1
      local.get 1
      i32.const 3
      i32.add
      i32.store offset=48
      local.get 1
      local.get 1
      i64.load offset=64
      local.tee 3
      i64.store offset=72
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 72
            i32.add
            i32.const 1049200
            i32.const 20
            call 6
            i32.const 65535
            i32.and
            br_if 0 (;@4;)
            i32.const 64
            local.set 0
            block  ;; label = @5
              loop  ;; label = @6
                local.get 2
                i64.const 100
                i64.lt_u
                br_if 1 (;@5;)
                local.get 1
                i32.const 95
                i32.add
                local.get 0
                i32.add
                i32.const -1
                i32.add
                local.get 2
                local.get 2
                i64.const 100
                i64.div_u
                local.tee 4
                i64.const 100
                i64.mul
                i64.sub
                i32.wrap_i64
                i32.const 1
                i32.shl
                i32.const 1048955
                i32.add
                i32.load16_u align=1
                i32.store16 align=1
                local.get 0
                i32.const -2
                i32.add
                local.set 0
                local.get 4
                local.set 2
                br 0 (;@6;)
              end
            end
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                i64.const 9
                i64.gt_u
                br_if 0 (;@6;)
                local.get 1
                i32.const 95
                i32.add
                local.get 0
                i32.add
                local.get 2
                i32.wrap_i64
                i32.const 48
                i32.or
                i32.store8
                br 1 (;@5;)
              end
              local.get 0
              i32.const -1
              i32.add
              local.tee 0
              local.get 1
              i32.const 95
              i32.add
              i32.add
              local.get 2
              i32.wrap_i64
              i32.const 1
              i32.shl
              i32.const 1048955
              i32.add
              i32.load16_u align=1
              i32.store16 align=1
            end
            local.get 1
            i32.const 95
            i32.add
            local.get 0
            i32.add
            i32.const 65
            local.get 0
            i32.sub
            i32.const 1049228
            local.get 1
            i32.const 64
            i32.add
            call 7
            i32.const 65535
            i32.and
            br_if 0 (;@4;)
            local.get 1
            local.get 3
            i64.store offset=80
            local.get 1
            i32.const 80
            i32.add
            i32.const 1049223
            i32.const 1
            call 6
            i32.const 65535
            i32.and
            i32.eqz
            br_if 1 (;@3;)
          end
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=56
        i32.const -1
        i32.add
        local.set 0
        local.get 1
        i32.load offset=48
        local.set 5
      end
      local.get 5
      local.get 0
      call 4
    end
    i64.const 40
    call 8
    drop
    local.get 1
    i32.const 160
    i32.add
    global.set 0)
  (func (;3;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 2
    global.set 0
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
    i32.load16_u offset=1049172
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
    i32.load offset=1048888 align=1
    i32.store offset=52
    local.get 2
    i32.const 0
    i32.load offset=1048891 align=1
    i32.store offset=55 align=1
    local.get 2
    i32.const 0
    i32.load offset=1049168 align=2
    i32.store offset=42 align=2
    local.get 2
    local.get 2
    i64.load offset=52 align=4
    i64.store offset=16
    local.get 2
    i32.const 1
    i32.store8 offset=14
    i32.const 1049156
    i32.const 11
    call 4
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
  (func (;4;) (type 3) (param i32 i32)
    i32.const 2
    local.get 0
    local.get 1
    call 0)
  (func (;5;) (type 0) (param i32 i32 i32 i32)
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
      call 26
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
  (func (;6;) (type 6) (param i32 i32 i32) (result i32)
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
        call_indirect (type 0)
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
  (func (;7;) (type 1) (param i32 i32 i32 i32) (result i32)
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
              i32.const 1049268
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
                i32.const 1049272
                local.set 6
                local.get 7
                i32.const -32
                i32.and
                i32.const -64
                i32.eq
                br_if 0 (;@6;)
                i32.const 1049276
                local.set 6
                local.get 7
                i32.const -16
                i32.and
                i32.const -32
                i32.eq
                br_if 0 (;@6;)
                i32.const 1049280
                i32.const 1049260
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
              call 6
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
                i32.load offset=1049268
                local.set 9
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 6
                i32.const 2047
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1049272
                local.set 9
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 6
                i32.const 65535
                i32.gt_u
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1049276
                local.set 9
                br 1 (;@5;)
              end
              i32.const 0
              i32.load offset=1049280
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
                  i32.const 1049264
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
                call 6
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
                call 24
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
              call 24
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
              call 6
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
              call 24
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
            call 24
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
            call 6
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
      call 6
      local.set 11
    end
    local.get 4
    i32.const 96
    i32.add
    global.set 0
    local.get 11)
  (func (;8;) (type 7) (param i64) (result i64)
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
      call 8
      local.get 1
      i64.add
      local.set 1
      local.get 0
      i64.const -1
      i64.add
      local.set 0
      br 0 (;@1;)
    end)
  (func (;9;) (type 8) (param i32) (result i32)
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
        i32.load offset=1049324
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1048896
        i32.const 48
        call 10
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
          i64.load offset=1049192
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
          call_indirect (type 1)
          local.tee 3
          br_if 1 (;@2;)
        end
        i32.const 1048840
        i32.const 47
        call 10
        br 1 (;@1;)
      end
      i32.const 0
      local.get 0
      i32.store offset=1049324
      i32.const 0
      local.get 3
      i32.store offset=1049320
      local.get 3
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set 0
    local.get 2)
  (func (;10;) (type 3) (param i32 i32)
    i32.const 0
    local.get 0
    local.get 1
    call 0)
  (func (;11;) (type 2) (param i32)
    (local i32)
    i32.const 0
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 4
        i32.add
        i32.const 0
        i32.load offset=1049324
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1048686
        i32.const 50
        call 10
        br 1 (;@1;)
      end
      i32.const 0
      i32.load offset=1049320
      local.get 0
      i32.add
      i32.load align=1
      local.set 1
    end
    local.get 1
    i32.const 0
    i32.load offset=1049304
    call_indirect (type 2))
  (func (;12;) (type 9) (param i32 i32) (result i32)
    (local i32 i32 i64 i32)
    global.get 0
    i32.const 224
    i32.sub
    local.tee 2
    global.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call 13
        local.tee 3
        i32.const 65535
        i32.and
        i32.const 7
        i32.eq
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
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
        i32.const 6
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
          call 6
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.get 2
          i32.const 200
          i32.add
          call 14
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
          call 6
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          i32.const 7
          local.get 2
          i32.const 200
          i32.add
          call 14
          i32.const 65535
          i32.and
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=184
          local.get 2
          i32.load offset=192
          call 10
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
      call 13
      local.set 3
      local.get 0
      i32.const 4
      i32.add
      call 13
      local.set 5
      local.get 2
      i32.const 134
      i32.add
      i32.const 6
      i32.add
      local.get 0
      i32.const 6
      i32.add
      call 13
      i32.store16
      local.get 2
      i32.const 134
      i32.add
      i32.const 4
      i32.add
      local.get 5
      i32.store16
      local.get 2
      local.get 3
      i32.store16 offset=136
      local.get 2
      i32.const 7
      i32.store16 offset=134
      local.get 2
      i32.const 142
      i32.add
      local.get 2
      i32.const 134
      i32.add
      i32.const 0
      i32.load offset=1049288
      call_indirect (type 3)
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
                  i32.load offset=1049324
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 1048788
                  i32.const 51
                  call 10
                  br 1 (;@6;)
                end
                i32.const 0
                i32.load offset=1049320
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
            i32.load offset=1049324
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 1048737
            i32.const 50
            call 10
            br 1 (;@3;)
          end
          i32.const 0
          i32.load offset=1049320
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
  (func (;13;) (type 8) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.add
      i32.const 0
      i32.load offset=1049324
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1048635
      i32.const 50
      call 10
      i32.const 0
      return
    end
    i32.const 0
    i32.load offset=1049320
    local.get 0
    i32.add
    i32.load16_u align=1)
  (func (;14;) (type 9) (param i32 i32) (result i32)
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
        i32.const 15
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
        i32.const 1048955
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
      i32.const 15
      i32.add
      i32.add
      local.get 4
      i32.const 1
      i32.shl
      i32.const 1048955
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    local.get 2
    i32.const 15
    i32.add
    local.get 3
    i32.add
    i32.const 17
    local.get 3
    i32.sub
    i32.const 1049228
    local.get 1
    call 7
    local.set 3
    local.get 2
    i32.const 32
    i32.add
    global.set 0
    local.get 3)
  (func (;15;) (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    i32.const 73
    i32.add
    i32.const 0
    i32.store8
    local.get 2
    i32.const 65
    i32.add
    i64.const 0
    i64.store align=1
    local.get 2
    i32.const 48
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    i32.const 0
    i32.load8_u offset=1048953
    i32.store8
    local.get 2
    i32.const 46
    i32.add
    i32.const 0
    i32.store16
    local.get 2
    i32.const 16
    i32.add
    i32.const 24
    i32.add
    local.tee 4
    local.get 2
    i32.const 48
    i32.add
    i32.const 24
    i32.add
    i32.load16_u
    i32.store16
    local.get 2
    i64.const 0
    i64.store offset=57 align=1
    local.get 2
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.tee 5
    local.get 3
    i64.load
    i64.store
    local.get 2
    i32.const 16
    i32.add
    i32.const 16
    i32.add
    local.tee 3
    local.get 2
    i32.const 48
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 2
    i32.const 0
    i32.store offset=42 align=2
    local.get 2
    i32.const 0
    i64.load offset=1048945 align=1
    local.tee 6
    i64.store offset=48
    local.get 2
    local.get 6
    i64.store offset=16
    local.get 2
    i32.const 0
    i32.store8 offset=14
    local.get 0
    i32.const 24
    i32.add
    local.get 4
    i64.load
    i64.store align=2
    local.get 0
    i32.const 16
    i32.add
    local.get 3
    i64.load
    i64.store align=2
    local.get 0
    i32.const 8
    i32.add
    local.get 5
    i64.load
    i64.store align=2
    local.get 0
    local.get 2
    i64.load offset=16
    i64.store align=2
    local.get 0
    i32.const 0
    i32.store8 offset=32
    local.get 2
    i32.const 80
    i32.add
    global.set 0)
  (func (;16;) (type 2) (param i32))
  (func (;17;) (type 6) (param i32 i32 i32) (result i32)
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
              call 18
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
  (func (;18;) (type 0) (param i32 i32 i32 i32)
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
  (func (;19;) (type 3) (param i32 i32)
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
      i32.const 1049252
      local.get 0
      local.get 1
      i32.const 2048
      local.get 1
      i32.const 2048
      i32.lt_u
      select
      local.get 0
      i32.sub
      call 20
    end
    block  ;; label = @1
      local.get 1
      i32.const 2048
      i32.le_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 0
        i32.load offset=1049316
        br_if 0 (;@2;)
        i32.const 0
        i32.const 4096
        i32.store offset=1049316
        i32.const 0
        local.get 1
        i32.const -1
        i32.add
        local.tee 1
        i32.const 16
        i32.shl
        local.tee 3
        i32.store offset=1049312
        local.get 3
        i32.const 0
        i32.const 65536
        call 25
        drop
      end
      local.get 2
      i32.const 0
      i64.load offset=1049312
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
      call 20
    end
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;20;) (type 4) (param i32 i32 i32)
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
    call 18
    local.get 3
    i32.const 16
    i32.add
    global.set 0)
  (func (;21;) (type 1) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.const -65535
      i32.ge_u
      br_if 0 (;@1;)
      block  ;; label = @2
        i32.const 1049252
        local.get 1
        i32.const 65535
        i32.add
        i32.const 16
        i32.shr_u
        local.tee 1
        local.get 2
        call 17
        local.tee 4
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 1049312
          local.get 1
          local.get 2
          call 17
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
        call 19
      end
      local.get 4
      i32.const 16
      i32.shl
      local.set 4
    end
    local.get 4)
  (func (;22;) (type 10) (param i32 i32 i32 i32 i32 i32) (result i32)
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
      call 19
    end
    local.get 2)
  (func (;23;) (type 11) (param i32 i32 i32 i32 i32)
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
    call 19)
  (func (;24;) (type 1) (param i32 i32 i32 i32) (result i32)
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
        call 6
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
  (func (;25;) (type 6) (param i32 i32 i32) (result i32)
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
  (func (;26;) (type 6) (param i32 i32 i32) (result i32)
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
  (table (;0;) 9 9 funcref)
  (memory (;0;) 17)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "clientInitialize" (func 1))
  (export "setup" (func 9))
  (export "tick" (func 11))
  (export "receiveGameParams" (func 12))
  (elem (;0;) (i32.const 1) func 2 3 5 15 16 21 22 23)
  (data (;0;) (i32.const 1048576) "ERROR: Can't parse GameParams v{d}; only prepared for v{d}\00CLIENT ERROR: u16 read will overrun reserve memory\00CLIENT ERROR: u32 read will overrun reserve memory\00CLIENT ERROR: Writing u8 outside of reserve memory\00CLIENT ERROR: Writing u16 outside of reserve memory\00CLIENT ERROR: Could not allocate reserve memory\00bot_zig\00CLIENT ERROR: Attempting to reserve memory twice\00[INVALID]\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899\00Good to go!\00\00\00\01\00\00\00\00\00\06\00\00\00\07\00\00\00\08\00\00\00\00\00\00\00\00\00\00\00X\02\10\00Incrementing fib to {d}\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00 \00\00\00\02\00\00\00\f0\02\10\00\10\00\00\00\09\00\00\00\ef\bf\bd\00\00\00\01\00\00\00\02\00\00\00\03\00\00\00\04\00")
  (data (;1;) (i32.const 1049288) "\04\00\00\00\00\00\00\00#\00\00\00\00\00\00\00\05\00\00\00\00\00\00\00\aa\aa\aa\aa\00\00\00\00"))
