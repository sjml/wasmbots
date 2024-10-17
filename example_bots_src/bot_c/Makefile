# CLANG = $(shell brew --cellar llvm)/$(shell brew list --versions llvm | tr ' ' '\n' | tail -1)/bin/clang
# CLANG_FLAGS = --target=wasm32 --no-standard-libraries -ffreestanding -nostdinc -Wl,--export-all -Wl,--no-entry -Wl,--allow-undefined
# CLANG_IMPORT_MEM_FLAGS = -Wl,--import-memory
EMCC = emcc
EMCC_FLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0 -Werror
LIBDIR = ../../libraries/C

bot_c.wasm: bot_c.c $(LIBDIR)/wasmbot_client.c
	$(EMCC) $(EMCC_FLAGS) -I$(LIBDIR) -o bot_c.wasm $?
	@# $(EMCC) $(EMCC_FLAGS) -DWSMBTCLNT_BOUNDS_CHECKING=0 -I$(LIBDIR) -o bot_c.wasm $?
	chmod -x $@

.PHONY: all
all: bot_c.wasm

.PHONY: clean
clean:
	rm -rf bot_c.wasm

.PHONY: install
install: all
	rsync -u -t -p bot_c.wasm ../../example_bots
	wasm2wat ../../example_bots/bot_c.wasm > ../../example_bots/bot_c.wat

.DEFAULT_GOAL = all
