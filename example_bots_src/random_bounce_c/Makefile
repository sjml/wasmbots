CC = emcc
CFLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0 -Werror
LIBDIR = ../../libraries/C
EXE_NAME = random_bounce

random_bounce.wasm: random_bounce.c $(LIBDIR)/wasmbot_client.c
	$(CC) $(CFLAGS) -I$(LIBDIR) $^ -o $@
	chmod -x $@

.PHONY: all
all: random_bounce.wasm

.PHONY: clean
clean:
	rm -rf random_bounce.wasm

.PHONY: install
install: all
	rsync -u -t -p random_bounce.wasm ../../example_bots/random_bounce_c.wasm

.DEFAULT_GOAL = all
