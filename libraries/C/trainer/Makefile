# eventually this will be absorbed into the bot's makefile

trainer: trainer.c
	clang -DNO_SSL -I./lib/cJSON ./lib/cJSON/cJSON.c -I./lib/civetweb/include ./lib/civetweb/src/civetweb.c trainer.c -o trainer
