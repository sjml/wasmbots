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
pub extern "C" fn setup(request_reserve: usize) -> usize {
    wasmbots_client::setup(request_reserve, Some(tick))
}
```

The host needs to see that `setup` function exported or it won't even try to run your module. Anyway, you can do whatever else you want in the function, but make sure you return the result of the `wasmbots_client::setup`. The `Some(tick)` parameter can also be `None`, of course, but `tick` should be a function that takes no parameters and returns nothing; it's "where the magic happens." 

Finally, make sure to build like so to actually get the WASM. 

```shell
cargo build --target wasm32-unknown-unknown --release
```

If any of this is too confusing just look at what the [example Rust bot](../../example_bots_src/bot_rs/) does.

Have fun!
