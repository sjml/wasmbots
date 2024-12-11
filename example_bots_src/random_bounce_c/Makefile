CC = emcc
CFLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0 -Werror
LIBDIR = ../../libraries/C
EXE_NAME = random_bounce

$(EXE_NAME).wasm: $(EXE_NAME).c $(LIBDIR)/wasmbot_client/client.c
	$(CC) $(CFLAGS) -I$(LIBDIR) $^ -o $@
	chmod -x $@

.PHONY: all
all: $(EXE_NAME).wasm

.PHONY: clean
clean:
	rm -rf $(EXE_NAME).wasm

.PHONY: install
install: all
	rsync -u -t -p $(EXE_NAME).wasm ../../example_bots/$(EXE_NAME).wasm

.DEFAULT_GOAL = all
