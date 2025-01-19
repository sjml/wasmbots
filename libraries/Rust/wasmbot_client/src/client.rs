//! A trait-based API for registering clients

use crate::{params::{self, read_initial_parameters, read_present_circumstances, write_move}, wasmbot_messages};

pub trait Client {
    /// Creates an instance of this client.
    fn create() -> Self;

    /// Gets metadata about this client.
    fn get_metadata(&mut self) -> params::BotMetadata;

    /// Called after setup to allow the client to handle the global game parameters.
    /// 
    /// Returns whether the client wants to proceed. By default, does nothing and returns `true`.
    fn receive_game_params(&mut self, _params: wasmbot_messages::InitialParameters) -> bool {
        true
    }

    /// Updates this client with the present circumstances and returns an action as a response.
    /// 
    /// Called after [`receive_game_params`](Client::receive_game_params) has been called.
    fn tick(&mut self, pc: wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message;
}

/// An instanced WasmBots client, including host reserve memory allocation.
/// 
/// Intended to be used by the [`register_client`] macro.
pub struct ClientInstance<C> {
    host_reserve: Box<[u8]>,
    client: C,
}

impl<C: Client> ClientInstance<C> {
    /// Sets up a client with the requested memory block containing the initial client metadata.
    pub fn setup(size: usize) -> Self {
        let mut client = C::create();

        let mut reserve = vec![0u8; size];
        let metadata = client.get_metadata();
        metadata.to_bytes(&mut reserve);

        let host_reserve = reserve.into_boxed_slice();

        Self {
            host_reserve,
            client,
        }
    }

    /// Decodes game parameters and send them to the client. Returns whether the client can proceed.
    pub fn receive_game_params(&mut self, offset: usize) -> bool {
        let Some(params) = read_initial_parameters(&self.host_reserve, offset) else {
            return false
        };

        self.client.receive_game_params(params)
    }

    /// Decodes present circumstances from the reserve memory and calls the client tick handler.
    pub fn tick(&mut self, offset: usize) {
        let Some(pc) = read_present_circumstances(&self.host_reserve, offset) else {
            return;
        };

        let submitted_move = self.client.tick(pc);

        write_move(&mut self.host_reserve, submitted_move);
    }

    /// Returns a mutable reference to the reserve memory
    pub fn reserve_mut(&mut self) -> &mut [u8] {
        &mut self.host_reserve
    }
}

#[macro_export]
macro_rules! register_client {
    ($client:ty) => {
        static mut CLIENT: ::core::mem::MaybeUninit<$crate::client::ClientInstance<$client>> = ::core::mem::MaybeUninit::uninit();

        #[export_name = "clientInitialize"]
        extern "C" fn client_initialize() {
            // Unused
        }

        #[export_name = "setup"]
        unsafe extern "C" fn setup(request_reserve: usize) -> *mut u8 {
            let mut client_instance = $crate::client::ClientInstance::setup(request_reserve);
            let reserve_ptr = client_instance.reserve_mut().as_mut_ptr();

            // SAFETY: During setup, we have exclusive access to `CLIENT`.
            unsafe { CLIENT = ::core::mem::MaybeUninit::new(client_instance); }

            // This reserve memory must not be accessed whenever we access `CLIENT`.
            // Because `CLIENT` is never dropped, the pointer remains valid for the lifetime
            // of the program.
            reserve_ptr
        }

        #[export_name = "receiveGameParams"]
        unsafe extern "C" fn receive_game_params(offset: usize) -> bool {
            // SAFETY: During `receiveGameParams`, we have exclusive access to `CLIENT`, including the reserve memory.
            let client = unsafe { CLIENT.assume_init_mut() };

            client.receive_game_params(offset)
        }

        #[export_name = "tick"]
        unsafe extern "C" fn tick(offset: usize) {
            // SAFETY: During `tick`, we have exclusive access to `CLIENT`, including the reserve memory.
            let client = unsafe { CLIENT.assume_init_mut() };

            client.tick(offset)
        }
    };
}
