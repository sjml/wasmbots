CLANG = /opt/homebrew/Cellar/llvm/19.1.0/bin/clang
CLANG_FLAGS = --target=wasm32 --no-standard-libraries -ffreestanding -nostdinc -Wl,--export-all -Wl,--no-entry -Wl,--allow-undefined

bot_c.wasm: bot_c.c
	$(CLANG) $(CLANG_FLAGS) -o bot_c.wasm bot_c.c

bot_c.wat: bot_c.wasm
	wasm2wat bot_c.wasm > bot_c.wat

.PHONY: all
all: bot_c.wasm bot_c.wat

.PHONY: install
install: all
	mv bot_c.wa* ../built_bots/

.DEFAULT_GOAL = all
