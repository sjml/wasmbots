//! A trait-based API for registering clients

use crate::{params, wasmbot_messages};

pub trait Client {
    fn setup() -> (params::BotMetadata, Self);
    fn tick(&mut self, pc: wasmbot_messages::PresentCircumstances) -> wasmbot_messages::Message;

    fn receive_game_params(&mut self, _params: wasmbot_messages::InitialParameters) -> bool {
        true
    }
}

#[macro_export]
macro_rules! register_client {
    ($client:ty) => {
        thread_local! {
            static CLIENT: ::core::cell::RefCell<Option<$client>> = ::core::cell::RefCell::new(None);
        }

        #[export_name="clientInitialize"]
        pub extern "C" fn client_initialize() {
            fn client_setup() -> $crate::params::BotMetadata {
                let (metadata, client) = $crate::client::Client::setup();
                CLIENT.set(Some(client));
                metadata
            }

            fn tick(pc: $crate::wasmbot_messages::PresentCircumstances) -> $crate::wasmbot_messages::Message {
                CLIENT.with_borrow_mut(|client| $crate::client::Client::tick(client.as_mut().unwrap(), pc))
            }

            fn receive_game_params(params: $crate::wasmbot_messages::InitialParameters) -> bool {
                CLIENT.with_borrow_mut(|client| $crate::client::Client::receive_game_params(client.as_mut().unwrap(), params))
            }

            $crate::params::register_client_setup(client_setup);
            $crate::params::register_client_receive_game_params(receive_game_params);
            $crate::register_tick_callback(tick);
        }
    };
}
