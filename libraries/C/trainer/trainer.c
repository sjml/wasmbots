#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>

#include "civetweb.h"
#include "cJSON.h"

#include "harness.h"


const bool CHATTY_SERVER = true;

static int setup_handler(struct mg_connection *conn, void *cbdata) {
	if (CHATTY_SERVER) {
		printf("/setup");
	}

	char buffer[4096];
	int buffer_len = mg_read(conn, buffer, sizeof(buffer) - 1);
	buffer[buffer_len] = 0;
	if (CHATTY_SERVER) {
		printf(" w/%s", buffer);
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
	size_t reserve = elem->valueint;
	cJSON_Delete(obj);


	const uint8_t* reserveBlockPtr = (uint8_t* )simulateSetup(reserve);
	if (reserveBlockPtr == NULL) {
		mg_send_http_error(conn, 500, "Could not reserve memory");
		return 500;
	}

	// size_t encodedBlockLen = ((reserve + 2) / 3) * 4 + 1;
	// char* encodedBuffer = (char*)malloc(encodedBlockLen + 1);
	// int res = mg_base64_encode((const unsigned char*)reserveBlockPtr, reserve, encodedBuffer, &encodedBlockLen);
	// if (res != -1) {
	// 	free(encodedBuffer);
	// 	mg_send_http_error(conn, 500, "Could not encode reserve memory");
	// 	return 500;
	// }
	// encodedBuffer[encodedBlockLen] = 0;
	// free(encodedBuffer);

	mg_send_http_ok(conn, "application/octet-stream", reserve);
	mg_write(conn, reserveBlockPtr, reserve);
	mg_close_connection(conn);
	return 0;
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

	printf("Listening...\n\n");

	while (1) {
		sleep(1);
	}

	mg_stop(ctx);
	return 0;
}
