MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(patsubst %/,%,$(dir $(MKFILE_PATH)))
EXE_NAME = wallflower
WASM_GO = tinygo
WASM_GO_FLAGS = -target=wasm-unknown -o $(EXE_NAME).wasm -opt=z -no-debug
NATIVE_GO = go
LIBDIR = ../../libraries/Go/wasmbot_client
TRAINER_DIR = ../../libraries/Go/trainer

$(EXE_NAME).wasm: $(EXE_NAME).go $(wildcard $(LIBDIR)/*.go)
	$(WASM_GO) build $(WASM_GO_FLAGS)
	chmod -x $@

$(EXE_NAME)-trainer: $(EXE_NAME).go $(wildcard $(LIBDIR)/*.go)
	$(NATIVE_GO) build -tags trainer -o $(EXE_NAME)-trainer

.PHONY: wasm
wasm: $(EXE_NAME).wasm

.PHONY: trainer
trainer: $(EXE_NAME)-trainer

.PHONY: all
all: wasm trainer

.PHONY: clean
clean:
	rm -rf $(EXE_NAME).wasm
	rm -rf $(EXE_NAME).so
	rm -rf $(EXE_NAME)-trainer

.PHONY: install
install: wasm
	rsync -u -t -p $(EXE_NAME).wasm ../../example_bots

.DEFAULT_GOAL = all
