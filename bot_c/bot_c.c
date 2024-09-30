extern void logFunction(unsigned int msgPtr, unsigned int msgLen);

// not wanting to bring in <string.h> just for this
unsigned int _strlen(const char* ptr) {
    unsigned int count = 0;
    while (*ptr != '\0') {
        count++;
        ptr++;
    }
    return count;
}

void run() {
    const char* msg = "C -> wasm reporting!";

    logFunction((unsigned int)msg, _strlen(msg));
}
