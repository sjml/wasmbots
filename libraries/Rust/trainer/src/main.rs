use axum::{
	body::Body,
	http::{header, Response, StatusCode},
	response::IntoResponse,
	routing::post,
	Json, Router,
};
use base64::prelude::*;
use serde::{Deserialize, Serialize};

mod harness;

const CHATTY_SERVER: bool = false;

#[derive(Deserialize, Debug)]
struct SetupRequest {
	reserve: usize,
}

#[derive(Deserialize, Debug)]
struct MemoryRequest {
	offset: usize,
	mem: String,
}

#[derive(Serialize)]
struct MemoryResult {
	success: bool,
	mem: String,
}

// single-thread this puppy
#[tokio::main(flavor = "current_thread")]
async fn main() {
	tracing_subscriber::fmt::init();

	let app = Router::new()
		.route("/setup", post(setup))
		.route("/receiveGameParams", post(receive_game_params))
		.route("/tick", post(tick));

	let listener = tokio::net::TcpListener::bind("127.0.0.1:9090")
		.await
		.unwrap();
	print!("Listening...\n\n");
	axum::serve(listener, app).await.unwrap();
}

async fn setup(Json(payload): Json<SetupRequest>) -> impl IntoResponse {
	if CHATTY_SERVER {
		println!("/setup w/{payload:#?}");
	}

	let reserve_block_ptr = match harness::simulate_setup(payload.reserve) {
		Ok(ptr) => ptr,
		Err(msg) => {
			return Response::builder()
				.status(StatusCode::INTERNAL_SERVER_ERROR)
				.body(Body::from(msg))
				.unwrap()
		}
	};

	if CHATTY_SERVER {
		println!("  [SUCCESS!]");
	}

	let reserve_block = unsafe { std::slice::from_raw_parts(reserve_block_ptr, payload.reserve) };

	Response::builder()
		.status(StatusCode::OK)
		.header(header::CONTENT_TYPE, "application/octet-stream")
		.body(Body::from(reserve_block))
		.unwrap()
}

async fn receive_game_params(Json(payload): Json<MemoryRequest>) -> impl IntoResponse {
	if CHATTY_SERVER {
		println!("/receiveGameParams w/{payload:#?}");
	}

	let decoded_mem = BASE64_STANDARD.decode(payload.mem).unwrap();

	match harness::simulate_receive_game_params(decoded_mem, payload.offset) {
		Ok(mem) => (
			StatusCode::OK,
			Json(MemoryResult {
				success: true,
				mem: BASE64_STANDARD.encode(mem),
			}),
		),
		Err(msg) => {
			if CHATTY_SERVER {
				println!("  <error> {}", msg);
			}
			(
				StatusCode::INTERNAL_SERVER_ERROR,
				Json(MemoryResult {
					success: false,
					mem: msg,
				}),
			)
		}
	}
}

async fn tick(Json(payload): Json<MemoryRequest>) -> impl IntoResponse {
	if CHATTY_SERVER {
		println!("/tick w/{payload:#?}");
	}

	let decoded_mem = BASE64_STANDARD.decode(payload.mem).unwrap();

	match harness::simulate_tick(decoded_mem, payload.offset) {
		Ok(mem) => (
			StatusCode::OK,
			Json(MemoryResult {
				success: true,
				mem: BASE64_STANDARD.encode(mem),
			}),
		),
		Err(msg) => (
			StatusCode::INTERNAL_SERVER_ERROR,
			Json(MemoryResult {
				success: false,
				mem: msg,
			}),
		),
	}
}
