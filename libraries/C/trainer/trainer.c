#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdbool.h>

#include "civetweb.h"
#include "cJSON.h"

const bool CHATTY_SERVER = true;

static int setup_handler(struct mg_connection *conn, void *cbdata) {
	if (CHATTY_SERVER) {
		printf("/setup\n");
	}

	char buffer[4096];
	int buffer_len = mg_read(conn, buffer, sizeof(buffer) - 1);
	buffer[buffer_len] = 0;
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

	const char* output = "{ \"success\": 1 }";

	mg_send_http_ok(conn, "application/json", strlen(output));
	mg_write(conn, output, strlen(output));
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
