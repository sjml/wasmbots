use std::collections::HashMap;

use serde;

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct MemoryExpectEntry {
    pub kind: String,
}

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FunctionExpectEntry {
    #[serde(default)] // false
    pub optional: bool,

    pub wasm_params: Vec<String>,
    pub wasm_return: Option<String>,
}

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Expectations {
    pub memory: MemoryExpectEntry,
    pub function_exports: HashMap<String, FunctionExpectEntry>,
    pub function_imports: HashMap<String, FunctionExpectEntry>,
}

impl Expectations {
    pub fn from_str(src: &str) -> Expectations {
        serde_json::from_str(src).expect("Expectations JSON was not well-formed.")
    }
}
