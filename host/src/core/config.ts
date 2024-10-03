const config = {
    version: [0, 0, 1],
    webRoot: "/",
    environment: typeof Deno !== "undefined" ? "Deno" : "Web",
}
export default config;
