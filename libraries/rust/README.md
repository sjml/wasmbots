# wasmbots-client (Rust crate)

To use this, first make a new project: 

```shell
cargo new my_wasmbot_client --lib
```

Then edit your `Cargo.toml` file to add:
```toml
[lib]
crate-type = ["cdylib"]
```

And add the dependency (local for now; I'm not publishing this to [crates.io](https://crates.io/) unless wasmbots takes over the world). 

```toml
[dependencies]
wasmbots_client = { path = "[path_to_local_crate]" }
```

Somewhere in your module **make sure** you have the following function: 
```rust
#[no_mangle]
pub extern "C" fn client_setup(_params: &GameParameters) -> bool {
    true
}
```
The GameParameters struct tells you the basic conditions of the game (how many players, what style of game, engine version, etc). You return `true` or `false` to indicate your readiness to play under those parameters. 

In the client setup, before returning, you can do whatever kinds of prep you want to for the game. Most importantly, you probably want to call `wasmbots_client::set_tick_callback` and pass it a pointer to a function that takes no parameters and returns void; it's where the magic happens.

Finally, make sure to build like this to actually get the WASM. 

```shell
cargo build --target wasm32-unknown-unknown --release
```

If any of this is too confusing just look at what the [example Rust bot](../../example_bots_src/bot_rs/) does.

Have fun!
