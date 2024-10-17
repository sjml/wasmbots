EMCC = emcc
EMCC_FLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0 -Werror
LIBDIR = ../../libraries/C
OUTDIR = ./bin
SRCDIR = ./src

C_FILES = $(wildcard $(SRCDIR)/*.c)
EXES = $(patsubst $(SRCDIR)/%.c,$(OUTDIR)/%.wasm,$(C_FILES))

.PHONY: all
all: $(EXES)

$(OUTDIR)/%.wasm: $(SRCDIR)/%.c $(LIBDIR)/wasmbot_client.c | $(OUTDIR)
	$(EMCC) $(EMCC_FLAGS) -I$(LIBDIR) $^ -o $@

$(OUTDIR):
	mkdir -p $(OUTDIR)

.PHONY: clean
clean:
	rm -rf $(OUTDIR)

.DEFAULT_GOAL = all
