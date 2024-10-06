use crate::host_reserve::HostReserve;
use crate::log;

const GP_VERSION: u16 = 7;

extern "C" {
    fn client_setup(params: &GameParameters) -> bool;
}

#[repr(C)]
pub struct GameParameters {
    pub params_version: u16,
    pub engine_version: [u16; 3],
}

#[no_mangle]
extern "C" fn receiveGameParams(mut offset: usize) -> bool {
    let res = HostReserve::new();

    let gp_version = res.read_u16(offset);
    offset += std::mem::size_of::<u16>();
    if gp_version != GP_VERSION {
        log(&format!("ERROR: Can't parse GameParams v{}; only prepared for v{}", gp_version, GP_VERSION));
        return false;
    }

    let mut eng_version = [0u16; 3];
    eng_version[0] = res.read_u16(offset);
    offset += std::mem::size_of::<u16>();
    eng_version[1] = res.read_u16(offset);
    offset += std::mem::size_of::<u16>();
    eng_version[2] = res.read_u16(offset);
    // offset += std::mem::size_of::<u16>();

    let gp = GameParameters{
        params_version: gp_version,
        engine_version: eng_version,
    };

    unsafe { client_setup(&gp) }
}
