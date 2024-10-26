GO = tinygo
GO_FLAGS = -target=wasm-unknown -o bot_go.wasm -opt=z -no-debug
LIBDIR = ../../libraries/TinyGo

bot_go.wasm: main.go $(wildcard $(LIBDIR)/*.go)
	$(GO) build $(GO_FLAGS)
	chmod -x $@

.PHONY: all
all: bot_go.wasm

.PHONY: clean
clean:
	rm -rf bot_go.wasm

.PHONY: install
install: all
	rsync -u -t -p bot_go.wasm ../../example_bots
	wasm2wat ../../example_bots/bot_go.wasm > ../../example_bots/bot_go.wat

.DEFAULT_GOAL = all
