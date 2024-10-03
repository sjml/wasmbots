BIN_NAME = wasmbots_validator
BIN = $(BIN_NAME).wasm
EMBED = $(BIN).ts
BIN_PATH = target/wasm32-unknown-unknown/release/
INSTALL_PATH = ../host/rsc/lib/

$(BIN_PATH)$(BIN): ./src/*.rs ./Cargo.toml
	cargo build --release --target wasm32-unknown-unknown

.PHONY: clean
clean:
	cargo clean

.PHONY: install
install: $(BIN_PATH)$(BIN)
	cp $(BIN_PATH)$(BIN) $(INSTALL_PATH)
	@# ../scripts/bin2ts.sh $(INSTALL_PATH)$(BIN) $(INSTALL_PATH)$(EMBED)
