#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>

#include "civetweb.h"
#include "cJSON.h"

#include "harness.h"


const bool CHATTY_SERVER = false;

static size_t _reserveMemSize = 0;

static int setup_handler(struct mg_connection *conn, void *cbdata) {
	if (CHATTY_SERVER) {
		printf("/setup");
	}

	char buffer[4096];
	int buffer_len = mg_read(conn, buffer, sizeof(buffer) - 1);
	buffer[buffer_len] = 0;
	if (CHATTY_SERVER) {
		printf(" w/%s\n", buffer);
	}

	cJSON *obj, *elem;
	obj = cJSON_Parse(buffer);
	if (obj == NULL) {
		mg_send_http_error(conn, 400, "Could not parse JSON");
		return 400;
	}

	elem = cJSON_GetObjectItem(obj, "reserve");
	if (!cJSON_IsNumber(elem)) {
		cJSON_Delete(obj);
		mg_send_http_error(conn, 400, "No reserve size given in JSON");
		return 400;
	}
	_reserveMemSize = elem->valueint;
	cJSON_Delete(obj);

	const uint8_t* reserveBlockPtr = (uint8_t* )simulateSetup(_reserveMemSize);
	if (reserveBlockPtr == NULL) {
		mg_send_http_error(conn, 500, "Could not reserve memory");
		return 500;
	}

	mg_send_http_ok(conn, "application/octet-stream", _reserveMemSize);
	mg_write(conn, reserveBlockPtr, _reserveMemSize);
	return 0;
}

int send_json_mem_response(struct mg_connection *conn, int code, bool success, char* msg) {
	mg_printf(conn, "HTTP/1.1 %d %s\r\n", code, mg_get_response_code_text(conn, code));
	mg_printf(conn, "Content-Type: application/json;\r\n");
	mg_printf(conn, "\r\n");
	mg_printf(conn, "{\"success\": %s, \"mem\": \"%s\"}", success ? "true" : "false", msg);
	return code;
}

static int receiveGameParams_handler(struct mg_connection *conn, void *cbdata) {
	if (CHATTY_SERVER) {
		printf("/receiveGameParams");
	}

	char buffer[4096];
	int buffer_len = mg_read(conn, buffer, sizeof(buffer) - 1);
	buffer[buffer_len] = 0;
	if (CHATTY_SERVER) {
		printf(" w/%s\n", buffer);
	}

	cJSON *obj, *elem;
	obj = cJSON_Parse(buffer);
	if (obj == NULL) {
		return send_json_mem_response(conn, 400, false, "Could not parse JSON");
	}

	elem = cJSON_GetObjectItem(obj, "offset");
	if (!cJSON_IsNumber(elem)) {
		cJSON_Delete(obj);
		return send_json_mem_response(conn, 400, false, "No offset given in JSON");
	}
	size_t offset = elem->valueint;

	elem = cJSON_GetObjectItem(obj, "mem");
	if (!cJSON_IsString(elem)) {
		cJSON_Delete(obj);
		return send_json_mem_response(conn, 400, false, "No memory string given in JSON");
	}
	char* encodedMem = elem->valuestring;
	size_t encodedMemLen = strlen(encodedMem);

	size_t decodedBlockLen = _reserveMemSize + 1;
	uint8_t* decodedBuffer = (uint8_t*)malloc(decodedBlockLen);
	int res = mg_base64_decode(encodedMem, encodedMemLen, decodedBuffer, &decodedBlockLen);
	if (res != -1 || decodedBlockLen - 1 != _reserveMemSize) {
		cJSON_Delete(obj);
		free(decodedBuffer);
		return send_json_mem_response(conn, 400, false, "Could not decode passed memory string");
	}
	cJSON_Delete(obj);

	uint8_t* updatedBuffer = (uint8_t*)simulateReceiveGameParams(decodedBuffer, offset);
	free(decodedBuffer);

	if (updatedBuffer == NULL) {
		return send_json_mem_response(conn, 400, false, "Bot declined game parameters");
	}

	size_t encodedBufferLen = ((_reserveMemSize + 2) / 3) * 4 + 1;
	char* encodedBuffer = malloc(encodedBufferLen);
	res = mg_base64_encode((const unsigned char*)updatedBuffer, _reserveMemSize, encodedBuffer, &encodedBufferLen);
	if (res != -1) {
		free(encodedBuffer);
		return send_json_mem_response(conn, 500, false, "Could not encode reserve memory");
	}

	send_json_mem_response(conn, 200, true, encodedBuffer);

	free(encodedBuffer);
	return 200;
}

static int tick_handler(struct mg_connection *conn, void *cbdata) {
	if (CHATTY_SERVER) {
		printf("/tick");
	}

	char buffer[4096];
	int buffer_len = mg_read(conn, buffer, sizeof(buffer) - 1);
	buffer[buffer_len] = 0;
	if (CHATTY_SERVER) {
		printf(" w/%s\n", buffer);
	}

	cJSON *obj, *elem;
	obj = cJSON_Parse(buffer);
	if (obj == NULL) {
		return send_json_mem_response(conn, 400, false, "Could not parse JSON");
	}

	elem = cJSON_GetObjectItem(obj, "offset");
	if (!cJSON_IsNumber(elem)) {
		cJSON_Delete(obj);
		return send_json_mem_response(conn, 400, false, "No offset given in JSON");
	}
	size_t offset = elem->valueint;

	elem = cJSON_GetObjectItem(obj, "mem");
	if (!cJSON_IsString(elem)) {
		cJSON_Delete(obj);
		return send_json_mem_response(conn, 400, false, "No memory string given in JSON");
	}
	char* encodedMem = elem->valuestring;
	size_t encodedMemLen = strlen(encodedMem);

	size_t decodedBlockLen = _reserveMemSize + 1;
	uint8_t* decodedBuffer = (uint8_t*)malloc(decodedBlockLen);
	int res = mg_base64_decode(encodedMem, encodedMemLen, decodedBuffer, &decodedBlockLen);
	if (res != -1 || decodedBlockLen - 1 != _reserveMemSize) {
		cJSON_Delete(obj);
		free(decodedBuffer);
		return send_json_mem_response(conn, 400, false, "Could not decode passed memory string");
	}
	cJSON_Delete(obj);

	uint8_t* updatedBuffer = (uint8_t*)simulateTick(decodedBuffer, offset);
	free(decodedBuffer);

	size_t encodedBufferLen = ((_reserveMemSize + 2) / 3) * 4 + 1;
	char* encodedBuffer = malloc(encodedBufferLen);
	res = mg_base64_encode((const unsigned char*)updatedBuffer, _reserveMemSize, encodedBuffer, &encodedBufferLen);
	if (res != -1) {
		free(encodedBuffer);
		return send_json_mem_response(conn, 500, false, "Could not encode reserve memory");
	}

	send_json_mem_response(conn, 200, true, encodedBuffer);

	free(encodedBuffer);
	return 200;
}


int main(void) {
	struct mg_context *ctx;
	struct mg_callbacks callbacks;
	const char *options[] = {
		"listening_ports", "9090",
		"num_threads", "1",
		NULL
	};

	memset(&callbacks, 0, sizeof(callbacks));

	ctx = mg_start(&callbacks, 0, options);
	if (!ctx) {
		printf("Cannot start trainer :(\n");
		return 1;
	}

	mg_set_request_handler(ctx, "/setup", setup_handler, NULL);
	mg_set_request_handler(ctx, "/receiveGameParams", receiveGameParams_handler, NULL);
	mg_set_request_handler(ctx, "/tick", tick_handler, NULL);

	printf("Listening...\n\n");

	while (1) {
		sleep(1);
	}

	mg_stop(ctx);
	return 0;
}
