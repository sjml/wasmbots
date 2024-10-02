BIN = target/wasm32-unknown-unknown/release/wasmbots_validator.wasm
INSTALL_PATH = ../host/lib/

$(BIN): ./src/*.rs
	cargo build --release --target wasm32-unknown-unknown

.PHONY: install
install: $(BIN)
	cp $(BIN) $(INSTALL_PATH)
