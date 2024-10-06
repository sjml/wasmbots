
use wasmbots_client::{self, HostReserve, GameParameters};

#[no_mangle]
pub extern "C" fn client_setup(_params: &GameParameters) -> bool {
    wasmbots_client::set_tick_callback(tick);
    wasmbots_client::log("Good to go!");

    true
}


fn tick() {
    fib(40);
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

// just a hack for now
#[no_mangle]
pub extern "C" fn runFib(offset: usize, result: usize) -> bool {
    let mut res = HostReserve::new();
    if result + std::mem::size_of::<u64>() > res.len() {
        wasmbots_client::log("Invalid result offset");
        return false;
    }
    if offset > res.len() {
        wasmbots_client::log("Invalid offset");
        return false;
    }
    let n = res.read_u8(offset);
    if n > 93 {
        wasmbots_client::log("Fib index too high");
        return false;
    }

    let fib_num = fib(n.into());
    res.write_u64(result, fib_num);
    true
}
