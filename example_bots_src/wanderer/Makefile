WASM_CC = emcc
WASM_CFLAGS = -s WASM=1 -s EXPORTED_FUNCTIONS='["_setup", "_receiveGameParams", "_tick"]' -O3 --no-entry -s ERROR_ON_UNDEFINED_SYMBOLS=0 -Werror
CC := clang
LIBDIR = ../../libraries/C
TRAINER_DIR = $(LIBDIR)/trainer
EXE_NAME = wanderer

$(EXE_NAME).wasm: $(EXE_NAME).c $(LIBDIR)/wasmbot_client/client.c
	$(WASM_CC) $(WASM_CFLAGS) -I$(LIBDIR) $^ -o $@
	chmod -x $@


.PHONY: trainer
trainer: $(EXE_NAME)-trainer

.PHONY: wasm
wasm: $(EXE_NAME).wasm

$(EXE_NAME)-trainer: $(EXE_NAME).c $(TRAINER_DIR)/trainer.c $(TRAINER_DIR)/harness.c
	$(CC) \
		-DNO_SSL \
		-I$(TRAINER_DIR)/lib/cJSON $(TRAINER_DIR)/lib/cJSON/cJSON.c \
		-I$(TRAINER_DIR)/lib/civetweb/include $(TRAINER_DIR)/lib/civetweb/src/civetweb.c \
		-I$(LIBDIR) $(LIBDIR)/wasmbot_client/client.c \
		$(TRAINER_DIR)/trainer.c $(TRAINER_DIR)/harness.c \
		$(EXE_NAME).c \
		-g -O0 \
		-o $(EXE_NAME)-trainer

.PHONY: all
all: wasm trainer

.PHONY: clean
clean:
	rm -rf $(EXE_NAME).wasm
	rm -rf $(EXE_NAME)-trainer*

.PHONY: install
install: wasm
	rsync -u -t -p $(EXE_NAME).wasm ../../example_bots/$(EXE_NAME).wasm

.DEFAULT_GOAL = all
