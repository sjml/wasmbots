BIN_NAME = wasmbots_validator
BIN = $(BIN_NAME).wasm
EMBED = $(BIN).ts
BIN_PATH = target/wasm32-unknown-unknown/release/
INSTALL_PATH = ../host/rsc/lib/
WASM_OPT_FLAGS = -Oz --zero-filled-memory --strip-producers

$(BIN_PATH)$(BIN): $(wildcard ./src/*.rs) ./Cargo.toml
	cargo build --release --target wasm32-unknown-unknown
	wasm-strip $@
	wasm-opt $@ $(WASM_OPT_FLAGS) -o $@

.PHONY: clean
clean:
	cargo clean

.PHONY: install
install: $(BIN_PATH)$(BIN)
	rsync -u -t -p $(BIN_PATH)$(BIN) $(INSTALL_PATH)
	@# ../scripts/bin2ts.sh $(INSTALL_PATH)$(BIN) $(INSTALL_PATH)$(EMBED)
