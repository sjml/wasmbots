#[cfg(target_arch = "wasm32")]
pub use crate::platform::wasm::*;

#[cfg(not(target_arch = "wasm32"))]
pub use crate::platform::trainer::*;
