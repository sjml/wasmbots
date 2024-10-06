
zig-out/bin/bot_zig.wasm: src/bot.zig
	zig build
	chmod -x $@

.PHONY: all
all: zig-out/bin/bot_zig.wasm

.PHONY: clean
clean:
	rm -rf ./.zig-cache ./zig-out

.PHONY: install
install: all
	rsync -u -t -p zig-out/bin/bot_zig.wasm ../../example_bots

.DEFAULT_GOAL = all
