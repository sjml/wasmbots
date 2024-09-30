(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i64) (result i64)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (param i32)))
  (type (;6;) (func (result i32)))
  (import "env" "logFunction" (func (;0;) (type 1)))
  (func (;1;) (type 2)
    nop)
  (func (;2;) (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 1080
    i32.const 20
    call 0
    global.get 0
    i32.const 16
    i32.sub
    local.tee 11
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
                        local.get 0
                        local.tee 10
                        i32.const 244
                        i32.le_u
                        if  ;; label = @11
                          i32.const 1120
                          i32.load
                          local.tee 4
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
                          local.tee 6
                          i32.const 3
                          i32.shr_u
                          local.tee 0
                          i32.shr_u
                          local.tee 1
                          i32.const 3
                          i32.and
                          if  ;; label = @12
                            block  ;; label = @13
                              local.get 1
                              i32.const -1
                              i32.xor
                              i32.const 1
                              i32.and
                              local.get 0
                              i32.add
                              local.tee 2
                              i32.const 3
                              i32.shl
                              local.tee 1
                              i32.const 1160
                              i32.add
                              local.tee 0
                              local.get 1
                              i32.const 1168
                              i32.add
                              i32.load
                              local.tee 1
                              i32.load offset=8
                              local.tee 5
                              i32.eq
                              if  ;; label = @14
                                i32.const 1120
                                local.get 4
                                i32.const -2
                                local.get 2
                                i32.rotl
                                i32.and
                                i32.store
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 0
                              i32.store offset=12
                              local.get 0
                              local.get 5
                              i32.store offset=8
                            end
                            local.get 1
                            i32.const 8
                            i32.add
                            local.set 0
                            local.get 1
                            local.get 2
                            i32.const 3
                            i32.shl
                            local.tee 2
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 1
                            local.get 2
                            i32.add
                            local.tee 1
                            local.get 1
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            br 11 (;@1;)
                          end
                          local.get 6
                          i32.const 1128
                          i32.load
                          local.tee 8
                          i32.le_u
                          br_if 1 (;@10;)
                          local.get 1
                          if  ;; label = @12
                            block  ;; label = @13
                              i32.const 2
                              local.get 0
                              i32.shl
                              local.tee 2
                              i32.const 0
                              local.get 2
                              i32.sub
                              i32.or
                              local.get 1
                              local.get 0
                              i32.shl
                              i32.and
                              i32.ctz
                              local.tee 1
                              i32.const 3
                              i32.shl
                              local.tee 0
                              i32.const 1160
                              i32.add
                              local.tee 2
                              local.get 0
                              i32.const 1168
                              i32.add
                              i32.load
                              local.tee 0
                              i32.load offset=8
                              local.tee 5
                              i32.eq
                              if  ;; label = @14
                                i32.const 1120
                                local.get 4
                                i32.const -2
                                local.get 1
                                i32.rotl
                                i32.and
                                local.tee 4
                                i32.store
                                br 1 (;@13;)
                              end
                              local.get 5
                              local.get 2
                              i32.store offset=12
                              local.get 2
                              local.get 5
                              i32.store offset=8
                            end
                            local.get 0
                            local.get 6
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 6
                            i32.add
                            local.tee 7
                            local.get 1
                            i32.const 3
                            i32.shl
                            local.tee 1
                            local.get 6
                            i32.sub
                            local.tee 5
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 1
                            i32.add
                            local.get 5
                            i32.store
                            local.get 8
                            if  ;; label = @13
                              local.get 8
                              i32.const -8
                              i32.and
                              i32.const 1160
                              i32.add
                              local.set 1
                              i32.const 1140
                              i32.load
                              local.set 2
                              block (result i32)  ;; label = @14
                                local.get 4
                                i32.const 1
                                local.get 8
                                i32.const 3
                                i32.shr_u
                                i32.shl
                                local.tee 3
                                i32.and
                                i32.eqz
                                if  ;; label = @15
                                  i32.const 1120
                                  local.get 3
                                  local.get 4
                                  i32.or
                                  i32.store
                                  local.get 1
                                  br 1 (;@14;)
                                end
                                local.get 1
                                i32.load offset=8
                              end
                              local.set 3
                              local.get 1
                              local.get 2
                              i32.store offset=8
                              local.get 3
                              local.get 2
                              i32.store offset=12
                              local.get 2
                              local.get 1
                              i32.store offset=12
                              local.get 2
                              local.get 3
                              i32.store offset=8
                            end
                            local.get 0
                            i32.const 8
                            i32.add
                            local.set 0
                            i32.const 1140
                            local.get 7
                            i32.store
                            i32.const 1128
                            local.get 5
                            i32.store
                            br 11 (;@1;)
                          end
                          i32.const 1124
                          i32.load
                          local.tee 12
                          i32.eqz
                          br_if 1 (;@10;)
                          local.get 12
                          i32.ctz
                          i32.const 2
                          i32.shl
                          i32.const 1424
                          i32.add
                          i32.load
                          local.tee 2
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 6
                          i32.sub
                          local.set 3
                          local.get 2
                          local.set 1
                          loop  ;; label = @12
                            block  ;; label = @13
                              local.get 1
                              i32.load offset=16
                              local.tee 0
                              i32.eqz
                              if  ;; label = @14
                                local.get 1
                                i32.load offset=20
                                local.tee 0
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              local.get 0
                              i32.load offset=4
                              i32.const -8
                              i32.and
                              local.get 6
                              i32.sub
                              local.tee 1
                              local.get 3
                              local.get 1
                              local.get 3
                              i32.lt_u
                              local.tee 1
                              select
                              local.set 3
                              local.get 0
                              local.get 2
                              local.get 1
                              select
                              local.set 2
                              local.get 0
                              local.set 1
                              br 1 (;@12;)
                            end
                          end
                          local.get 2
                          i32.load offset=24
                          local.set 9
                          local.get 2
                          local.get 2
                          i32.load offset=12
                          local.tee 0
                          i32.ne
                          if  ;; label = @12
                            local.get 2
                            i32.load offset=8
                            local.tee 1
                            local.get 0
                            i32.store offset=12
                            local.get 0
                            local.get 1
                            i32.store offset=8
                            br 10 (;@2;)
                          end
                          local.get 2
                          i32.load offset=20
                          local.tee 1
                          if (result i32)  ;; label = @12
                            local.get 2
                            i32.const 20
                            i32.add
                          else
                            local.get 2
                            i32.load offset=16
                            local.tee 1
                            i32.eqz
                            br_if 3 (;@9;)
                            local.get 2
                            i32.const 16
                            i32.add
                          end
                          local.set 5
                          loop  ;; label = @12
                            local.get 5
                            local.set 7
                            local.get 1
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.set 5
                            local.get 0
                            i32.load offset=20
                            local.tee 1
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 16
                            i32.add
                            local.set 5
                            local.get 0
                            i32.load offset=16
                            local.tee 1
                            br_if 0 (;@12;)
                          end
                          local.get 7
                          i32.const 0
                          i32.store
                          br 9 (;@2;)
                        end
                        i32.const -1
                        local.set 6
                        local.get 10
                        i32.const -65
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 10
                        i32.const 11
                        i32.add
                        local.tee 0
                        i32.const -8
                        i32.and
                        local.set 6
                        i32.const 1124
                        i32.load
                        local.tee 7
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 31
                        local.set 8
                        i32.const 0
                        local.get 6
                        i32.sub
                        local.set 3
                        local.get 10
                        i32.const 16777204
                        i32.le_u
                        if  ;; label = @11
                          local.get 6
                          i32.const 38
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
                          local.set 8
                        end
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 8
                              i32.const 2
                              i32.shl
                              i32.const 1424
                              i32.add
                              i32.load
                              local.tee 1
                              i32.eqz
                              if  ;; label = @14
                                i32.const 0
                                local.set 0
                                br 1 (;@13;)
                              end
                              i32.const 0
                              local.set 0
                              local.get 6
                              i32.const 25
                              local.get 8
                              i32.const 1
                              i32.shr_u
                              i32.sub
                              i32.const 0
                              local.get 8
                              i32.const 31
                              i32.ne
                              select
                              i32.shl
                              local.set 2
                              loop  ;; label = @14
                                block  ;; label = @15
                                  local.get 1
                                  i32.load offset=4
                                  i32.const -8
                                  i32.and
                                  local.get 6
                                  i32.sub
                                  local.tee 4
                                  local.get 3
                                  i32.ge_u
                                  br_if 0 (;@15;)
                                  local.get 1
                                  local.set 5
                                  local.get 4
                                  local.tee 3
                                  br_if 0 (;@15;)
                                  i32.const 0
                                  local.set 3
                                  local.get 1
                                  local.set 0
                                  br 3 (;@12;)
                                end
                                local.get 0
                                local.get 1
                                i32.load offset=20
                                local.tee 4
                                local.get 4
                                local.get 1
                                local.get 2
                                i32.const 29
                                i32.shr_u
                                i32.const 4
                                i32.and
                                i32.add
                                i32.load offset=16
                                local.tee 1
                                i32.eq
                                select
                                local.get 0
                                local.get 4
                                select
                                local.set 0
                                local.get 2
                                i32.const 1
                                i32.shl
                                local.set 2
                                local.get 1
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 0
                            local.get 5
                            i32.or
                            i32.eqz
                            if  ;; label = @13
                              i32.const 0
                              local.set 5
                              i32.const 2
                              local.get 8
                              i32.shl
                              local.tee 0
                              i32.const 0
                              local.get 0
                              i32.sub
                              i32.or
                              local.get 7
                              i32.and
                              local.tee 0
                              i32.eqz
                              br_if 3 (;@10;)
                              local.get 0
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 1424
                              i32.add
                              i32.load
                              local.set 0
                            end
                            local.get 0
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          loop  ;; label = @12
                            local.get 0
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 6
                            i32.sub
                            local.tee 2
                            local.get 3
                            i32.lt_u
                            local.set 1
                            local.get 2
                            local.get 3
                            local.get 1
                            select
                            local.set 3
                            local.get 0
                            local.get 5
                            local.get 1
                            select
                            local.set 5
                            local.get 0
                            i32.load offset=16
                            local.tee 1
                            if (result i32)  ;; label = @13
                              local.get 1
                            else
                              local.get 0
                              i32.load offset=20
                            end
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                        end
                        local.get 5
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const 1128
                        i32.load
                        local.get 6
                        i32.sub
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 5
                        i32.load offset=24
                        local.set 8
                        local.get 5
                        local.get 5
                        i32.load offset=12
                        local.tee 0
                        i32.ne
                        if  ;; label = @11
                          local.get 5
                          i32.load offset=8
                          local.tee 1
                          local.get 0
                          i32.store offset=12
                          local.get 0
                          local.get 1
                          i32.store offset=8
                          br 8 (;@3;)
                        end
                        local.get 5
                        i32.load offset=20
                        local.tee 1
                        if (result i32)  ;; label = @11
                          local.get 5
                          i32.const 20
                          i32.add
                        else
                          local.get 5
                          i32.load offset=16
                          local.tee 1
                          i32.eqz
                          br_if 3 (;@8;)
                          local.get 5
                          i32.const 16
                          i32.add
                        end
                        local.set 2
                        loop  ;; label = @11
                          local.get 2
                          local.set 4
                          local.get 1
                          local.tee 0
                          i32.const 20
                          i32.add
                          local.set 2
                          local.get 0
                          i32.load offset=20
                          local.tee 1
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 16
                          i32.add
                          local.set 2
                          local.get 0
                          i32.load offset=16
                          local.tee 1
                          br_if 0 (;@11;)
                        end
                        local.get 4
                        i32.const 0
                        i32.store
                        br 7 (;@3;)
                      end
                      local.get 6
                      i32.const 1128
                      i32.load
                      local.tee 5
                      i32.le_u
                      if  ;; label = @10
                        i32.const 1140
                        i32.load
                        local.set 0
                        block  ;; label = @11
                          local.get 5
                          local.get 6
                          i32.sub
                          local.tee 1
                          i32.const 16
                          i32.ge_u
                          if  ;; label = @12
                            local.get 0
                            local.get 6
                            i32.add
                            local.tee 2
                            local.get 1
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 0
                            local.get 5
                            i32.add
                            local.get 1
                            i32.store
                            local.get 0
                            local.get 6
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            br 1 (;@11;)
                          end
                          local.get 0
                          local.get 5
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 0
                          local.get 5
                          i32.add
                          local.tee 1
                          local.get 1
                          i32.load offset=4
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          i32.const 0
                          local.set 2
                          i32.const 0
                          local.set 1
                        end
                        i32.const 1128
                        local.get 1
                        i32.store
                        i32.const 1140
                        local.get 2
                        i32.store
                        local.get 0
                        i32.const 8
                        i32.add
                        local.set 0
                        br 9 (;@1;)
                      end
                      local.get 6
                      i32.const 1132
                      i32.load
                      local.tee 2
                      i32.lt_u
                      if  ;; label = @10
                        i32.const 1132
                        local.get 2
                        local.get 6
                        i32.sub
                        local.tee 1
                        i32.store
                        i32.const 1144
                        i32.const 1144
                        i32.load
                        local.tee 0
                        local.get 6
                        i32.add
                        local.tee 2
                        i32.store
                        local.get 2
                        local.get 1
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 6
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 0
                        i32.const 8
                        i32.add
                        local.set 0
                        br 9 (;@1;)
                      end
                      i32.const 0
                      local.set 0
                      local.get 6
                      i32.const 47
                      i32.add
                      local.tee 3
                      block (result i32)  ;; label = @10
                        i32.const 1592
                        i32.load
                        if  ;; label = @11
                          i32.const 1600
                          i32.load
                          br 1 (;@10;)
                        end
                        i32.const 1604
                        i64.const -1
                        i64.store align=4
                        i32.const 1596
                        i64.const 17592186048512
                        i64.store align=4
                        i32.const 1592
                        local.get 11
                        i32.const 12
                        i32.add
                        i32.const -16
                        i32.and
                        i32.const 1431655768
                        i32.xor
                        i32.store
                        i32.const 1612
                        i32.const 0
                        i32.store
                        i32.const 1564
                        i32.const 0
                        i32.store
                        i32.const 4096
                      end
                      local.tee 1
                      i32.add
                      local.tee 4
                      i32.const 0
                      local.get 1
                      i32.sub
                      local.tee 7
                      i32.and
                      local.tee 1
                      local.get 6
                      i32.le_u
                      br_if 8 (;@1;)
                      i32.const 1560
                      i32.load
                      local.tee 5
                      if  ;; label = @10
                        i32.const 1552
                        i32.load
                        local.tee 8
                        local.get 1
                        i32.add
                        local.tee 9
                        local.get 8
                        i32.le_u
                        br_if 9 (;@1;)
                        local.get 5
                        local.get 9
                        i32.lt_u
                        br_if 9 (;@1;)
                      end
                      block  ;; label = @10
                        i32.const 1564
                        i32.load8_u
                        i32.const 4
                        i32.and
                        i32.eqz
                        if  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  i32.const 1144
                                  i32.load
                                  local.tee 5
                                  if  ;; label = @16
                                    i32.const 1568
                                    local.set 0
                                    loop  ;; label = @17
                                      local.get 0
                                      i32.load
                                      local.tee 8
                                      local.get 5
                                      i32.le_u
                                      if  ;; label = @18
                                        local.get 5
                                        local.get 8
                                        local.get 0
                                        i32.load offset=4
                                        i32.add
                                        i32.lt_u
                                        br_if 3 (;@15;)
                                      end
                                      local.get 0
                                      i32.load offset=8
                                      local.tee 0
                                      br_if 0 (;@17;)
                                    end
                                  end
                                  i32.const 0
                                  call 5
                                  local.tee 2
                                  i32.const -1
                                  i32.eq
                                  br_if 3 (;@12;)
                                  local.get 1
                                  local.set 4
                                  i32.const 1596
                                  i32.load
                                  local.tee 0
                                  i32.const 1
                                  i32.sub
                                  local.tee 5
                                  local.get 2
                                  i32.and
                                  if  ;; label = @16
                                    local.get 1
                                    local.get 2
                                    i32.sub
                                    local.get 2
                                    local.get 5
                                    i32.add
                                    i32.const 0
                                    local.get 0
                                    i32.sub
                                    i32.and
                                    i32.add
                                    local.set 4
                                  end
                                  local.get 4
                                  local.get 6
                                  i32.le_u
                                  br_if 3 (;@12;)
                                  i32.const 1560
                                  i32.load
                                  local.tee 0
                                  if  ;; label = @16
                                    i32.const 1552
                                    i32.load
                                    local.tee 5
                                    local.get 4
                                    i32.add
                                    local.tee 7
                                    local.get 5
                                    i32.le_u
                                    br_if 4 (;@12;)
                                    local.get 0
                                    local.get 7
                                    i32.lt_u
                                    br_if 4 (;@12;)
                                  end
                                  local.get 4
                                  call 5
                                  local.tee 0
                                  local.get 2
                                  i32.ne
                                  br_if 1 (;@14;)
                                  br 5 (;@10;)
                                end
                                local.get 4
                                local.get 2
                                i32.sub
                                local.get 7
                                i32.and
                                local.tee 4
                                call 5
                                local.tee 2
                                local.get 0
                                i32.load
                                local.get 0
                                i32.load offset=4
                                i32.add
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 2
                                local.set 0
                              end
                              local.get 0
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 6
                              i32.const 48
                              i32.add
                              local.get 4
                              i32.le_u
                              if  ;; label = @14
                                local.get 0
                                local.set 2
                                br 4 (;@10;)
                              end
                              i32.const 1600
                              i32.load
                              local.tee 2
                              local.get 3
                              local.get 4
                              i32.sub
                              i32.add
                              i32.const 0
                              local.get 2
                              i32.sub
                              i32.and
                              local.tee 2
                              call 5
                              i32.const -1
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 2
                              local.get 4
                              i32.add
                              local.set 4
                              local.get 0
                              local.set 2
                              br 3 (;@10;)
                            end
                            local.get 2
                            i32.const -1
                            i32.ne
                            br_if 2 (;@10;)
                          end
                          i32.const 1564
                          i32.const 1564
                          i32.load
                          i32.const 4
                          i32.or
                          i32.store
                        end
                        local.get 1
                        call 5
                        local.set 2
                        i32.const 0
                        call 5
                        local.set 0
                        local.get 2
                        i32.const -1
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 0
                        i32.const -1
                        i32.eq
                        br_if 5 (;@5;)
                        local.get 0
                        local.get 2
                        i32.le_u
                        br_if 5 (;@5;)
                        local.get 0
                        local.get 2
                        i32.sub
                        local.tee 4
                        local.get 6
                        i32.const 40
                        i32.add
                        i32.le_u
                        br_if 5 (;@5;)
                      end
                      i32.const 1552
                      i32.const 1552
                      i32.load
                      local.get 4
                      i32.add
                      local.tee 0
                      i32.store
                      i32.const 1556
                      i32.load
                      local.get 0
                      i32.lt_u
                      if  ;; label = @10
                        i32.const 1556
                        local.get 0
                        i32.store
                      end
                      block  ;; label = @10
                        i32.const 1144
                        i32.load
                        local.tee 3
                        if  ;; label = @11
                          i32.const 1568
                          local.set 0
                          loop  ;; label = @12
                            local.get 2
                            local.get 0
                            i32.load
                            local.tee 1
                            local.get 0
                            i32.load offset=4
                            local.tee 5
                            i32.add
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 0
                            i32.load offset=8
                            local.tee 0
                            br_if 0 (;@12;)
                          end
                          br 4 (;@7;)
                        end
                        i32.const 1136
                        i32.load
                        local.tee 0
                        i32.const 0
                        local.get 0
                        local.get 2
                        i32.le_u
                        select
                        i32.eqz
                        if  ;; label = @11
                          i32.const 1136
                          local.get 2
                          i32.store
                        end
                        i32.const 0
                        local.set 0
                        i32.const 1572
                        local.get 4
                        i32.store
                        i32.const 1568
                        local.get 2
                        i32.store
                        i32.const 1152
                        i32.const -1
                        i32.store
                        i32.const 1156
                        i32.const 1592
                        i32.load
                        i32.store
                        i32.const 1580
                        i32.const 0
                        i32.store
                        loop  ;; label = @11
                          local.get 0
                          i32.const 3
                          i32.shl
                          local.tee 1
                          i32.const 1168
                          i32.add
                          local.get 1
                          i32.const 1160
                          i32.add
                          local.tee 5
                          i32.store
                          local.get 1
                          i32.const 1172
                          i32.add
                          local.get 5
                          i32.store
                          local.get 0
                          i32.const 1
                          i32.add
                          local.tee 0
                          i32.const 32
                          i32.ne
                          br_if 0 (;@11;)
                        end
                        i32.const 1132
                        local.get 4
                        i32.const 40
                        i32.sub
                        local.tee 0
                        i32.const -8
                        local.get 2
                        i32.sub
                        i32.const 7
                        i32.and
                        local.tee 1
                        i32.sub
                        local.tee 5
                        i32.store
                        i32.const 1144
                        local.get 1
                        local.get 2
                        i32.add
                        local.tee 1
                        i32.store
                        local.get 1
                        local.get 5
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 2
                        i32.add
                        i32.const 40
                        i32.store offset=4
                        i32.const 1148
                        i32.const 1608
                        i32.load
                        i32.store
                        br 4 (;@6;)
                      end
                      local.get 2
                      local.get 3
                      i32.le_u
                      br_if 2 (;@7;)
                      local.get 1
                      local.get 3
                      i32.gt_u
                      br_if 2 (;@7;)
                      local.get 0
                      i32.load offset=12
                      i32.const 8
                      i32.and
                      br_if 2 (;@7;)
                      local.get 0
                      local.get 4
                      local.get 5
                      i32.add
                      i32.store offset=4
                      i32.const 1144
                      local.get 3
                      i32.const -8
                      local.get 3
                      i32.sub
                      i32.const 7
                      i32.and
                      local.tee 0
                      i32.add
                      local.tee 1
                      i32.store
                      i32.const 1132
                      i32.const 1132
                      i32.load
                      local.get 4
                      i32.add
                      local.tee 2
                      local.get 0
                      i32.sub
                      local.tee 0
                      i32.store
                      local.get 1
                      local.get 0
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 2
                      local.get 3
                      i32.add
                      i32.const 40
                      i32.store offset=4
                      i32.const 1148
                      i32.const 1608
                      i32.load
                      i32.store
                      br 3 (;@6;)
                    end
                    i32.const 0
                    local.set 0
                    br 6 (;@2;)
                  end
                  i32.const 0
                  local.set 0
                  br 4 (;@3;)
                end
                i32.const 1136
                i32.load
                local.get 2
                i32.gt_u
                if  ;; label = @7
                  i32.const 1136
                  local.get 2
                  i32.store
                end
                local.get 2
                local.get 4
                i32.add
                local.set 5
                i32.const 1568
                local.set 0
                block  ;; label = @7
                  loop  ;; label = @8
                    local.get 5
                    local.get 0
                    i32.load
                    local.tee 1
                    i32.ne
                    if  ;; label = @9
                      local.get 0
                      i32.load offset=8
                      local.tee 0
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                  end
                  local.get 0
                  i32.load8_u offset=12
                  i32.const 8
                  i32.and
                  i32.eqz
                  br_if 3 (;@4;)
                end
                i32.const 1568
                local.set 0
                loop  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load
                    local.tee 1
                    local.get 3
                    i32.le_u
                    if  ;; label = @9
                      local.get 3
                      local.get 1
                      local.get 0
                      i32.load offset=4
                      i32.add
                      local.tee 5
                      i32.lt_u
                      br_if 1 (;@8;)
                    end
                    local.get 0
                    i32.load offset=8
                    local.set 0
                    br 1 (;@7;)
                  end
                end
                i32.const 1132
                local.get 4
                i32.const 40
                i32.sub
                local.tee 0
                i32.const -8
                local.get 2
                i32.sub
                i32.const 7
                i32.and
                local.tee 1
                i32.sub
                local.tee 7
                i32.store
                i32.const 1144
                local.get 1
                local.get 2
                i32.add
                local.tee 1
                i32.store
                local.get 1
                local.get 7
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 0
                local.get 2
                i32.add
                i32.const 40
                i32.store offset=4
                i32.const 1148
                i32.const 1608
                i32.load
                i32.store
                local.get 3
                local.get 5
                i32.const 39
                local.get 5
                i32.sub
                i32.const 7
                i32.and
                i32.add
                i32.const 47
                i32.sub
                local.tee 0
                local.get 0
                local.get 3
                i32.const 16
                i32.add
                i32.lt_u
                select
                local.tee 1
                i32.const 27
                i32.store offset=4
                local.get 1
                i32.const 1576
                i64.load align=4
                i64.store offset=16 align=4
                local.get 1
                i32.const 1568
                i64.load align=4
                i64.store offset=8 align=4
                i32.const 1576
                local.get 1
                i32.const 8
                i32.add
                i32.store
                i32.const 1572
                local.get 4
                i32.store
                i32.const 1568
                local.get 2
                i32.store
                i32.const 1580
                i32.const 0
                i32.store
                local.get 1
                i32.const 24
                i32.add
                local.set 0
                loop  ;; label = @7
                  local.get 0
                  i32.const 7
                  i32.store offset=4
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 2
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 0
                  local.get 2
                  local.get 5
                  i32.lt_u
                  br_if 0 (;@7;)
                end
                local.get 1
                local.get 3
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                local.get 1
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
                local.get 3
                local.get 1
                local.get 3
                i32.sub
                local.tee 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                local.get 2
                i32.store
                block (result i32)  ;; label = @7
                  local.get 2
                  i32.const 255
                  i32.le_u
                  if  ;; label = @8
                    local.get 2
                    i32.const -8
                    i32.and
                    i32.const 1160
                    i32.add
                    local.set 0
                    block (result i32)  ;; label = @9
                      i32.const 1120
                      i32.load
                      local.tee 1
                      i32.const 1
                      local.get 2
                      i32.const 3
                      i32.shr_u
                      i32.shl
                      local.tee 2
                      i32.and
                      i32.eqz
                      if  ;; label = @10
                        i32.const 1120
                        local.get 1
                        local.get 2
                        i32.or
                        i32.store
                        local.get 0
                        br 1 (;@9;)
                      end
                      local.get 0
                      i32.load offset=8
                    end
                    local.set 1
                    local.get 0
                    local.get 3
                    i32.store offset=8
                    local.get 1
                    local.get 3
                    i32.store offset=12
                    i32.const 12
                    local.set 2
                    i32.const 8
                    br 1 (;@7;)
                  end
                  i32.const 31
                  local.set 0
                  local.get 2
                  i32.const 16777215
                  i32.le_u
                  if  ;; label = @8
                    local.get 2
                    i32.const 38
                    local.get 2
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
                  local.get 3
                  local.get 0
                  i32.store offset=28
                  local.get 3
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 0
                  i32.const 2
                  i32.shl
                  i32.const 1424
                  i32.add
                  local.set 1
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 1124
                      i32.load
                      local.tee 5
                      i32.const 1
                      local.get 0
                      i32.shl
                      local.tee 4
                      i32.and
                      i32.eqz
                      if  ;; label = @10
                        i32.const 1124
                        local.get 4
                        local.get 5
                        i32.or
                        i32.store
                        local.get 1
                        local.get 3
                        i32.store
                        br 1 (;@9;)
                      end
                      local.get 2
                      i32.const 25
                      local.get 0
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      i32.const 0
                      local.get 0
                      i32.const 31
                      i32.ne
                      select
                      i32.shl
                      local.set 0
                      local.get 1
                      i32.load
                      local.set 5
                      loop  ;; label = @10
                        local.get 5
                        local.tee 1
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 2
                        i32.eq
                        br_if 2 (;@8;)
                        local.get 0
                        i32.const 29
                        i32.shr_u
                        local.set 5
                        local.get 0
                        i32.const 1
                        i32.shl
                        local.set 0
                        local.get 1
                        local.get 5
                        i32.const 4
                        i32.and
                        i32.add
                        local.tee 4
                        i32.load offset=16
                        local.tee 5
                        br_if 0 (;@10;)
                      end
                      local.get 4
                      local.get 3
                      i32.store offset=16
                    end
                    local.get 3
                    local.get 1
                    i32.store offset=24
                    i32.const 8
                    local.set 2
                    local.get 3
                    local.tee 1
                    local.set 0
                    i32.const 12
                    br 1 (;@7;)
                  end
                  local.get 1
                  i32.load offset=8
                  local.tee 0
                  local.get 3
                  i32.store offset=12
                  local.get 1
                  local.get 3
                  i32.store offset=8
                  local.get 3
                  local.get 0
                  i32.store offset=8
                  i32.const 0
                  local.set 0
                  i32.const 24
                  local.set 2
                  i32.const 12
                end
                local.get 3
                i32.add
                local.get 1
                i32.store
                local.get 2
                local.get 3
                i32.add
                local.get 0
                i32.store
              end
              i32.const 1132
              i32.load
              local.tee 0
              local.get 6
              i32.le_u
              br_if 0 (;@5;)
              i32.const 1132
              local.get 0
              local.get 6
              i32.sub
              local.tee 1
              i32.store
              i32.const 1144
              i32.const 1144
              i32.load
              local.tee 0
              local.get 6
              i32.add
              local.tee 2
              i32.store
              local.get 2
              local.get 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 6
              i32.const 3
              i32.or
              i32.store offset=4
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              br 4 (;@1;)
            end
            i32.const 1116
            i32.const 48
            i32.store
            i32.const 0
            local.set 0
            br 3 (;@1;)
          end
          local.get 0
          local.get 2
          i32.store
          local.get 0
          local.get 0
          i32.load offset=4
          local.get 4
          i32.add
          i32.store offset=4
          local.get 2
          i32.const -8
          local.get 2
          i32.sub
          i32.const 7
          i32.and
          i32.add
          local.tee 8
          local.get 6
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 1
          i32.const -8
          local.get 1
          i32.sub
          i32.const 7
          i32.and
          i32.add
          local.tee 4
          local.get 6
          local.get 8
          i32.add
          local.tee 3
          i32.sub
          local.set 7
          block  ;; label = @4
            i32.const 1144
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              i32.const 1144
              local.get 3
              i32.store
              i32.const 1132
              i32.const 1132
              i32.load
              local.get 7
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              br 1 (;@4;)
            end
            i32.const 1140
            i32.load
            local.get 4
            i32.eq
            if  ;; label = @5
              i32.const 1140
              local.get 3
              i32.store
              i32.const 1128
              i32.const 1128
              i32.load
              local.get 7
              i32.add
              local.tee 0
              i32.store
              local.get 3
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 0
              i32.store
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=4
            local.tee 0
            i32.const 3
            i32.and
            i32.const 1
            i32.eq
            if  ;; label = @5
              local.get 0
              i32.const -8
              i32.and
              local.set 9
              local.get 4
              i32.load offset=12
              local.set 2
              block  ;; label = @6
                local.get 0
                i32.const 255
                i32.le_u
                if  ;; label = @7
                  local.get 4
                  i32.load offset=8
                  local.tee 1
                  local.get 2
                  i32.eq
                  if  ;; label = @8
                    i32.const 1120
                    i32.const 1120
                    i32.load
                    i32.const -2
                    local.get 0
                    i32.const 3
                    i32.shr_u
                    i32.rotl
                    i32.and
                    i32.store
                    br 2 (;@6;)
                  end
                  local.get 1
                  local.get 2
                  i32.store offset=12
                  local.get 2
                  local.get 1
                  i32.store offset=8
                  br 1 (;@6;)
                end
                local.get 4
                i32.load offset=24
                local.set 6
                block  ;; label = @7
                  local.get 2
                  local.get 4
                  i32.ne
                  if  ;; label = @8
                    local.get 4
                    i32.load offset=8
                    local.tee 0
                    local.get 2
                    i32.store offset=12
                    local.get 2
                    local.get 0
                    i32.store offset=8
                    br 1 (;@7;)
                  end
                  block  ;; label = @8
                    local.get 4
                    i32.load offset=20
                    local.tee 0
                    if (result i32)  ;; label = @9
                      local.get 4
                      i32.const 20
                      i32.add
                    else
                      local.get 4
                      i32.load offset=16
                      local.tee 0
                      i32.eqz
                      br_if 1 (;@8;)
                      local.get 4
                      i32.const 16
                      i32.add
                    end
                    local.set 1
                    loop  ;; label = @9
                      local.get 1
                      local.set 5
                      local.get 0
                      local.tee 2
                      i32.const 20
                      i32.add
                      local.set 1
                      local.get 0
                      i32.load offset=20
                      local.tee 0
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 16
                      i32.add
                      local.set 1
                      local.get 2
                      i32.load offset=16
                      local.tee 0
                      br_if 0 (;@9;)
                    end
                    local.get 5
                    i32.const 0
                    i32.store
                    br 1 (;@7;)
                  end
                  i32.const 0
                  local.set 2
                end
                local.get 6
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 4
                  i32.load offset=28
                  local.tee 0
                  i32.const 2
                  i32.shl
                  i32.const 1424
                  i32.add
                  local.tee 1
                  i32.load
                  local.get 4
                  i32.eq
                  if  ;; label = @8
                    local.get 1
                    local.get 2
                    i32.store
                    local.get 2
                    br_if 1 (;@7;)
                    i32.const 1124
                    i32.const 1124
                    i32.load
                    i32.const -2
                    local.get 0
                    i32.rotl
                    i32.and
                    i32.store
                    br 2 (;@6;)
                  end
                  local.get 6
                  i32.const 16
                  i32.const 20
                  local.get 6
                  i32.load offset=16
                  local.get 4
                  i32.eq
                  select
                  i32.add
                  local.get 2
                  i32.store
                  local.get 2
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 2
                local.get 6
                i32.store offset=24
                local.get 4
                i32.load offset=16
                local.tee 0
                if  ;; label = @7
                  local.get 2
                  local.get 0
                  i32.store offset=16
                  local.get 0
                  local.get 2
                  i32.store offset=24
                end
                local.get 4
                i32.load offset=20
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                local.get 2
                local.get 0
                i32.store offset=20
                local.get 0
                local.get 2
                i32.store offset=24
              end
              local.get 7
              local.get 9
              i32.add
              local.set 7
              local.get 4
              local.get 9
              i32.add
              local.tee 4
              i32.load offset=4
              local.set 0
            end
            local.get 4
            local.get 0
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 3
            local.get 7
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 3
            local.get 7
            i32.add
            local.get 7
            i32.store
            local.get 7
            i32.const 255
            i32.le_u
            if  ;; label = @5
              local.get 7
              i32.const -8
              i32.and
              i32.const 1160
              i32.add
              local.set 0
              block (result i32)  ;; label = @6
                i32.const 1120
                i32.load
                local.tee 1
                i32.const 1
                local.get 7
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 2
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1120
                  local.get 1
                  local.get 2
                  i32.or
                  i32.store
                  local.get 0
                  br 1 (;@6;)
                end
                local.get 0
                i32.load offset=8
              end
              local.set 1
              local.get 0
              local.get 3
              i32.store offset=8
              local.get 1
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 0
              i32.store offset=12
              local.get 3
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 31
            local.set 2
            local.get 7
            i32.const 16777215
            i32.le_u
            if  ;; label = @5
              local.get 7
              i32.const 38
              local.get 7
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
              local.set 2
            end
            local.get 3
            local.get 2
            i32.store offset=28
            local.get 3
            i64.const 0
            i64.store offset=16 align=4
            local.get 2
            i32.const 2
            i32.shl
            i32.const 1424
            i32.add
            local.set 0
            block  ;; label = @5
              block  ;; label = @6
                i32.const 1124
                i32.load
                local.tee 1
                i32.const 1
                local.get 2
                i32.shl
                local.tee 5
                i32.and
                i32.eqz
                if  ;; label = @7
                  i32.const 1124
                  local.get 1
                  local.get 5
                  i32.or
                  i32.store
                  local.get 0
                  local.get 3
                  i32.store
                  br 1 (;@6;)
                end
                local.get 7
                i32.const 25
                local.get 2
                i32.const 1
                i32.shr_u
                i32.sub
                i32.const 0
                local.get 2
                i32.const 31
                i32.ne
                select
                i32.shl
                local.set 2
                local.get 0
                i32.load
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  local.tee 0
                  i32.load offset=4
                  i32.const -8
                  i32.and
                  local.get 7
                  i32.eq
                  br_if 2 (;@5;)
                  local.get 2
                  i32.const 29
                  i32.shr_u
                  local.set 1
                  local.get 2
                  i32.const 1
                  i32.shl
                  local.set 2
                  local.get 0
                  local.get 1
                  i32.const 4
                  i32.and
                  i32.add
                  local.tee 5
                  i32.load offset=16
                  local.tee 1
                  br_if 0 (;@7;)
                end
                local.get 5
                local.get 3
                i32.store offset=16
              end
              local.get 3
              local.get 0
              i32.store offset=24
              local.get 3
              local.get 3
              i32.store offset=12
              local.get 3
              local.get 3
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
            local.tee 1
            local.get 3
            i32.store offset=12
            local.get 0
            local.get 3
            i32.store offset=8
            local.get 3
            i32.const 0
            i32.store offset=24
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 3
            local.get 1
            i32.store offset=8
          end
          local.get 8
          i32.const 8
          i32.add
          local.set 0
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 5
            i32.load offset=28
            local.tee 1
            i32.const 2
            i32.shl
            i32.const 1424
            i32.add
            local.tee 2
            i32.load
            local.get 5
            i32.eq
            if  ;; label = @5
              local.get 2
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 1124
              local.get 7
              i32.const -2
              local.get 1
              i32.rotl
              i32.and
              local.tee 7
              i32.store
              br 2 (;@3;)
            end
            local.get 8
            i32.const 16
            i32.const 20
            local.get 8
            i32.load offset=16
            local.get 5
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 8
          i32.store offset=24
          local.get 5
          i32.load offset=16
          local.tee 1
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.store offset=16
            local.get 1
            local.get 0
            i32.store offset=24
          end
          local.get 5
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          i32.store offset=20
          local.get 1
          local.get 0
          i32.store offset=24
        end
        block  ;; label = @3
          local.get 3
          i32.const 15
          i32.le_u
          if  ;; label = @4
            local.get 5
            local.get 3
            local.get 6
            i32.add
            local.tee 0
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 0
            local.get 5
            i32.add
            local.tee 0
            local.get 0
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 5
          local.get 6
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 5
          local.get 6
          i32.add
          local.tee 4
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 3
          local.get 4
          i32.add
          local.get 3
          i32.store
          local.get 3
          i32.const 255
          i32.le_u
          if  ;; label = @4
            local.get 3
            i32.const -8
            i32.and
            i32.const 1160
            i32.add
            local.set 0
            block (result i32)  ;; label = @5
              i32.const 1120
              i32.load
              local.tee 1
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1120
                local.get 1
                local.get 2
                i32.or
                i32.store
                local.get 0
                br 1 (;@5;)
              end
              local.get 0
              i32.load offset=8
            end
            local.set 1
            local.get 0
            local.get 4
            i32.store offset=8
            local.get 1
            local.get 4
            i32.store offset=12
            local.get 4
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 1
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 0
          local.get 3
          i32.const 16777215
          i32.le_u
          if  ;; label = @4
            local.get 3
            i32.const 38
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
          local.get 4
          local.get 0
          i32.store offset=28
          local.get 4
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 2
          i32.shl
          i32.const 1424
          i32.add
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.const 1
              local.get 0
              i32.shl
              local.tee 2
              i32.and
              i32.eqz
              if  ;; label = @6
                i32.const 1124
                local.get 2
                local.get 7
                i32.or
                i32.store
                local.get 1
                local.get 4
                i32.store
                local.get 4
                local.get 1
                i32.store offset=24
                br 1 (;@5;)
              end
              local.get 3
              i32.const 25
              local.get 0
              i32.const 1
              i32.shr_u
              i32.sub
              i32.const 0
              local.get 0
              i32.const 31
              i32.ne
              select
              i32.shl
              local.set 0
              local.get 1
              i32.load
              local.set 1
              loop  ;; label = @6
                local.get 1
                local.tee 2
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 3
                i32.eq
                br_if 2 (;@4;)
                local.get 0
                i32.const 29
                i32.shr_u
                local.set 1
                local.get 0
                i32.const 1
                i32.shl
                local.set 0
                local.get 2
                local.get 1
                i32.const 4
                i32.and
                i32.add
                local.tee 7
                i32.load offset=16
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 7
              local.get 4
              i32.store offset=16
              local.get 4
              local.get 2
              i32.store offset=24
            end
            local.get 4
            local.get 4
            i32.store offset=12
            local.get 4
            local.get 4
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.tee 0
          local.get 4
          i32.store offset=12
          local.get 2
          local.get 4
          i32.store offset=8
          local.get 4
          i32.const 0
          i32.store offset=24
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 4
          local.get 0
          i32.store offset=8
        end
        local.get 5
        i32.const 8
        i32.add
        local.set 0
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 2
          i32.load offset=28
          local.tee 1
          i32.const 2
          i32.shl
          i32.const 1424
          i32.add
          local.tee 5
          i32.load
          local.get 2
          i32.eq
          if  ;; label = @4
            local.get 5
            local.get 0
            i32.store
            local.get 0
            br_if 1 (;@3;)
            i32.const 1124
            local.get 12
            i32.const -2
            local.get 1
            i32.rotl
            i32.and
            i32.store
            br 2 (;@2;)
          end
          local.get 9
          i32.const 16
          i32.const 20
          local.get 9
          i32.load offset=16
          local.get 2
          i32.eq
          select
          i32.add
          local.get 0
          i32.store
          local.get 0
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 0
        local.get 9
        i32.store offset=24
        local.get 2
        i32.load offset=16
        local.tee 1
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.store offset=16
          local.get 1
          local.get 0
          i32.store offset=24
        end
        local.get 2
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
        local.get 3
        i32.const 15
        i32.le_u
        if  ;; label = @3
          local.get 2
          local.get 3
          local.get 6
          i32.add
          local.tee 0
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.tee 0
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 2
        local.get 6
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 2
        local.get 6
        i32.add
        local.tee 5
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 3
        local.get 5
        i32.add
        local.get 3
        i32.store
        local.get 8
        if  ;; label = @3
          local.get 8
          i32.const -8
          i32.and
          i32.const 1160
          i32.add
          local.set 0
          i32.const 1140
          i32.load
          local.set 1
          block (result i32)  ;; label = @4
            i32.const 1
            local.get 8
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 7
            local.get 4
            i32.and
            i32.eqz
            if  ;; label = @5
              i32.const 1120
              local.get 4
              local.get 7
              i32.or
              i32.store
              local.get 0
              br 1 (;@4;)
            end
            local.get 0
            i32.load offset=8
          end
          local.set 4
          local.get 0
          local.get 1
          i32.store offset=8
          local.get 4
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 1
          local.get 4
          i32.store offset=8
        end
        i32.const 1140
        local.get 5
        i32.store
        i32.const 1128
        local.get 3
        i32.store
      end
      local.get 2
      i32.const 8
      i32.add
      local.set 0
    end
    local.get 11
    i32.const 16
    i32.add
    global.set 0
    i32.const 1112
    local.get 10
    i32.store
    i32.const 1108
    local.get 0
    i32.store
    local.get 0)
  (func (;3;) (type 3) (param i64) (result i64)
    (local i64 i32)
    local.get 0
    i64.const 2
    i64.ge_u
    if (result i64)  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i64.const 2
        i64.sub
        call 3
        local.get 1
        i64.add
        local.set 1
        local.get 0
        i64.const 2
        i64.gt_u
        local.set 2
        local.get 0
        i64.const 1
        i64.sub
        local.set 0
        local.get 2
        br_if 0 (;@2;)
      end
      i64.const 1
    else
      local.get 0
    end
    local.get 1
    i64.add)
  (func (;4;) (type 4) (param i32 i32) (result i32)
    (local i32 i64)
    i32.const 1112
    i32.load
    local.tee 2
    local.get 1
    i32.const 8
    i32.add
    i32.lt_u
    if  ;; label = @1
      i32.const 1024
      i32.const 21
      call 0
      i32.const 0
      return
    end
    local.get 0
    local.get 2
    i32.gt_u
    if  ;; label = @1
      i32.const 1046
      i32.const 14
      call 0
      i32.const 0
      return
    end
    local.get 0
    i32.const 1108
    i32.load
    local.tee 0
    i32.add
    i64.load8_u
    local.tee 3
    i64.const 94
    i64.ge_u
    if  ;; label = @1
      i32.const 1061
      i32.const 18
      call 0
      i32.const 0
      return
    end
    local.get 0
    local.get 1
    i32.add
    local.get 3
    call 3
    i64.store align=1
    i32.const 1)
  (func (;5;) (type 0) (param i32) (result i32)
    (local i32 i32)
    i32.const 1104
    i32.load
    local.tee 1
    local.get 0
    i32.const 7
    i32.add
    i32.const -8
    i32.and
    local.tee 2
    i32.add
    local.set 0
    block  ;; label = @1
      local.get 2
      i32.const 0
      local.get 0
      local.get 1
      i32.le_u
      select
      i32.eqz
      if  ;; label = @2
        local.get 0
        memory.size
        i32.const 16
        i32.shl
        i32.le_u
        br_if 1 (;@1;)
      end
      i32.const 1116
      i32.const 48
      i32.store
      i32.const -1
      return
    end
    i32.const 1104
    local.get 0
    i32.store
    local.get 1)
  (func (;6;) (type 5) (param i32)
    local.get 0
    global.set 0)
  (func (;7;) (type 6) (result i32)
    global.get 0)
  (table (;0;) 2 2 funcref)
  (memory (;0;) 258 258)
  (global (;0;) (mut i32) (i32.const 67152))
  (export "memory" (memory 0))
  (export "setup" (func 2))
  (export "runFib" (func 4))
  (export "_initialize" (func 1))
  (export "__indirect_function_table" (table 0))
  (export "_emscripten_stack_restore" (func 6))
  (export "emscripten_stack_get_current" (func 7))
  (elem (;0;) (i32.const 1) func 1)
  (data (;0;) (i32.const 1024) "Invalid result offset\00Invalid offset\00Fib index too high\00C -> wasm reporting!")
  (data (;1;) (i32.const 1104) "P\06\01"))
