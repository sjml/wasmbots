use wasmbots_client::params;

#[no_mangle]
pub extern "C" fn client_setup(_params: &params::GameParameters) -> params::BotMetadata {
    wasmbots_client::set_tick_callback(tick);

    let mut bot_meta = params::BotMetadata {
        name: params::make_bot_name(env!("CARGO_PKG_NAME")),
        bot_version: [0, 0, 0],
        ready: false,
    };

    let version_str = env!("CARGO_PKG_VERSION");
    let mut version_parts = version_str.split('.');
    if version_parts.clone().count() != 3 {
        wasmbots_client::log_err("CLIENT ERROR: version must be semver");
        return bot_meta;
    }
    let major = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");
    let minor = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");
    let patch = version_parts.next().unwrap().parse::<u16>().expect("Semver parts must fit in u16");

    bot_meta.bot_version = [major, minor, patch];
    bot_meta.ready = true;

    wasmbots_client::log("Good to go!");
    bot_meta
}


fn tick() {
    fib(41);
}

// intentionally inefficient fibonacci calculator
fn fib(n: u64) -> u64 {
    if n < 2 {
        n
    }
    else {
        fib(n-2) + fib(n-1)
    }
}
