
target/wasm32-unknown-unknown/release/bot_rs.wasm: src/lib.rs
	cargo build --release
	@# cargo build --release --no-default-features
	chmod -x $@

.PHONY: all
all: target/wasm32-unknown-unknown/release/bot_rs.wasm

.PHONY: clean
clean:
	cargo clean

.PHONY: install
install: all
	rsync -u -t -p target/wasm32-unknown-unknown/release/bot_rs.wasm ../../example_bots
	wasm2wat ../../example_bots/bot_rs.wasm > ../../example_bots/bot_rs.wat

.DEFAULT_GOAL = all
