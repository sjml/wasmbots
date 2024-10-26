EXE_NAME = random_bounce

zig-out/bin/$(EXE_NAME).wasm: src/bot.zig
	zig build
	chmod -x $@

.PHONY: all
all: zig-out/bin/$(EXE_NAME).wasm

.PHONY: clean
clean:
	rm -rf ./.zig-cache ./zig-out

.PHONY: install
install: all
	rsync -u -t -p zig-out/bin/$(EXE_NAME).wasm ../../example_bots/$(EXE_NAME)_zig.wasm

.DEFAULT_GOAL = all
