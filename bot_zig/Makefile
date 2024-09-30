
zig-out/bin/bot_zig.wasm: src/bot.zig
	zig build

.PHONY: all
all: zig-out/bin/bot_zig.wasm

.PHONY: install
install: all
	rsync -u -t -p zig-out/bin/bot_zig.wasm ../built_bots

.DEFAULT_GOAL = all
