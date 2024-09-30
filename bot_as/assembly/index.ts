@external("env", "logFunction")
declare function logFunction(msgPtr: usize, msgLen: usize): void;

export function run(): void {
    const rawMsg = "AssemblyScript -> wasm reporting!";
    const msg = String.UTF8.encode(rawMsg);

    logFunction(changetype<usize>(msg), msg.byteLength);
}
