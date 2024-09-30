
zig-out/bin/bot_zig.wasm: src/root.zig
	zig build

zig-out/bin/bot_zig.wat: zig-out/bin/bot_zig.wasm
	wasm2wat zig-out/bin/bot_zig.wasm > zig-out/bin/bot_zig.wat

.PHONY: all
all: zig-out/bin/bot_zig.wasm zig-out/bin/bot_zig.wat

.PHONY: install
install: all
	mv zig-out/bin/bot_zig.wa* ../built_bots/

.DEFAULT_GOAL = all
