use std::env;

fn main() {
	let library_name = env::var("BOT_LIBRARY_NAME").unwrap();
	let library_path = env::var("BOT_LIBRARY_PATH").unwrap();
	println!("cargo:rustc-link-lib=static={library_name}");
	println!("cargo:rustc-link-search=native={library_path}");
}
