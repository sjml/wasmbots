use wasmbots_client::params;

fn client_setup(_params: &params::GameParameters) -> params::BotMetadata {
    let mut bot_meta = params::BotMetadata {
        name: params::make_bot_name(env!("CARGO_PKG_NAME")),
        version: [0, 0, 0],
        ready: false,
    };

    let version_str = env!("CARGO_PKG_VERSION");
    let mut version_parts = version_str.split('.');
    if version_parts.clone().count() != 3 {
        wasmbots_client::log_err("CLIENT ERROR: version must be semver");
        return bot_meta;
    }
    let major = version_parts
        .next()
        .unwrap()
        .parse::<u16>()
        .expect("Semver parts must fit in u16");
    let minor = version_parts
        .next()
        .unwrap()
        .parse::<u16>()
        .expect("Semver parts must fit in u16");
    let patch = version_parts
        .next()
        .unwrap()
        .parse::<u16>()
        .expect("Semver parts must fit in u16");

    bot_meta.version = [major, minor, patch];
    bot_meta.ready = true;

    bot_meta
}

// can also do this safely with std::sync::atomic, but we know this
//   is always single-threaded, and I'm going for simplicity right now.
static mut CURRENT_FIB: u64 = 35;

fn tick(last_duration: u32) {
    unsafe {
        if last_duration < 250 {
            CURRENT_FIB += 1;
            wasmbots_client::log(&format!("Incrementing fib to {}", CURRENT_FIB));
        }
        fib(CURRENT_FIB);
    }
}

// intentionally inefficient fibonacci calculator
fn fib(n: u64) -> u64 {
    if n < 2 {
        n
    } else {
        fib(n - 2) + fib(n - 1)
    }
}

#[export_name="clientInitialize"]
pub extern "C" fn client_initialize() {
    params::register_client_setup(client_setup);
    wasmbots_client::register_tick_callback(tick);
}
