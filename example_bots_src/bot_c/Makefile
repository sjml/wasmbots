CLANG = $(shell brew --cellar llvm)/$(shell brew list --versions llvm | tr ' ' '\n' | tail -1)/bin/clang
CLANG_FLAGS = --target=wasm32 --no-standard-libraries -ffreestanding -nostdinc -Wl,--export-all -Wl,--no-entry -Wl,--allow-undefined
CLANG_IMPORT_MEM_FLAGS = -Wl,--import-memory
EMCC = emcc
EMCC_FLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick", "_runFib"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0

bot_c.wasm: bot_c.c
	$(EMCC) $(EMCC_FLAGS) -o bot_c.wasm bot_c.c
	chmod -x $@

.PHONY: all
all: bot_c.wasm

.PHONY: clean
clean:
	rm -rf bot_c.wasm

.PHONY: install
install: all
	rsync -u -t -p bot_c.wasm ../../example_bots

.DEFAULT_GOAL = all
