use std::collections::HashMap;

use serde;

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct MemoryExpectEntry {
    // pub doc: String,
    pub kind: String,
}

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct FunctionExpectEntry {
    // pub doc: String,
    // pub params_doc: Vec<String>,
    // pub return_doc: String,
    pub params: Vec<String>,
    pub r#return: String,
}

#[derive(Debug, serde::Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct Expectations {
    pub memory: MemoryExpectEntry,
    pub function_exports: HashMap<String, FunctionExpectEntry>,
}

impl Expectations {
    pub fn from_str(src: &str) -> Expectations {
        serde_json::from_str(src).expect("Expectations JSON was not well-formed.")
    }
}
