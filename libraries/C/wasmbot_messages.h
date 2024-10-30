/*
   This file was automatically generated by Beschi v0.2.0
   <https://github.com/sjml/beschi>
   Do not edit directly.
*/

// To use this header file, include it normally wherever you need access
//   to its structures and functions.
// Then in *exactly* one file, #define WASMBOTSMESSAGE_IMPLEMENTATION
//   *before* including it.

#ifndef INCLUDE_WASMBOTSMESSAGE_H
#define INCLUDE_WASMBOTSMESSAGE_H

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

typedef uint8_t WasmBotsMessage_err_t;
#define WASMBOTSMESSAGE_ERR_OK  0
#define WASMBOTSMESSAGE_ERR_EOF 1
#define WASMBOTSMESSAGE_ERR_INVALID_DATA 2
#define WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE 3

#ifdef __cplusplus
extern "C" {
#endif

///////////////////////////////////////
// standard utility declarations

typedef struct {
    uint8_t* buffer;
    size_t bufferSize;
    size_t position;
} WasmBotsMessage_DataAccess;

bool WasmBotsMessage_IsFinished(WasmBotsMessage_DataAccess *r);
WasmBotsMessage_err_t WasmBotsMessage__ReadUInt8(WasmBotsMessage_DataAccess *r, uint8_t *ui8);
WasmBotsMessage_err_t WasmBotsMessage__ReadBool(WasmBotsMessage_DataAccess *r, bool *b);
WasmBotsMessage_err_t WasmBotsMessage__ReadInt16(WasmBotsMessage_DataAccess *r, int16_t *i16);
WasmBotsMessage_err_t WasmBotsMessage__ReadUInt16(WasmBotsMessage_DataAccess *r, uint16_t *ui16);
WasmBotsMessage_err_t WasmBotsMessage__ReadInt32(WasmBotsMessage_DataAccess *r, int32_t *i32);
WasmBotsMessage_err_t WasmBotsMessage__ReadUInt32(WasmBotsMessage_DataAccess *r, uint32_t *ui32);
WasmBotsMessage_err_t WasmBotsMessage__ReadInt64(WasmBotsMessage_DataAccess *r, int64_t *i64);
WasmBotsMessage_err_t WasmBotsMessage__ReadUInt64(WasmBotsMessage_DataAccess *r, uint64_t *ui32);
WasmBotsMessage_err_t WasmBotsMessage__ReadFloat(WasmBotsMessage_DataAccess *r, float *f);
WasmBotsMessage_err_t WasmBotsMessage__ReadDouble(WasmBotsMessage_DataAccess *r, double *d);
WasmBotsMessage_err_t WasmBotsMessage__ReadString(WasmBotsMessage_DataAccess *r, char **s, uint8_t *len);

WasmBotsMessage_err_t WasmBotsMessage__WriteUInt8(WasmBotsMessage_DataAccess *w, const uint8_t *ui8);
WasmBotsMessage_err_t WasmBotsMessage__WriteBool(WasmBotsMessage_DataAccess *w, const bool *b);
WasmBotsMessage_err_t WasmBotsMessage__WriteInt16(WasmBotsMessage_DataAccess *w, const int16_t *i16);
WasmBotsMessage_err_t WasmBotsMessage__WriteUInt16(WasmBotsMessage_DataAccess *w, const uint16_t *ui16);
WasmBotsMessage_err_t WasmBotsMessage__WriteInt32(WasmBotsMessage_DataAccess *w, const int32_t *i32);
WasmBotsMessage_err_t WasmBotsMessage__WriteUInt32(WasmBotsMessage_DataAccess *w, const uint32_t *ui32);
WasmBotsMessage_err_t WasmBotsMessage__WriteInt64(WasmBotsMessage_DataAccess *w, const int64_t *i64);
WasmBotsMessage_err_t WasmBotsMessage__WriteUInt64(WasmBotsMessage_DataAccess *w, const uint64_t *ui32);
WasmBotsMessage_err_t WasmBotsMessage__WriteFloat(WasmBotsMessage_DataAccess *w, const float *f);
WasmBotsMessage_err_t WasmBotsMessage__WriteDouble(WasmBotsMessage_DataAccess *w, const double *d);
WasmBotsMessage_err_t WasmBotsMessage__WriteString(WasmBotsMessage_DataAccess *w, char* const *s, const uint8_t *len);

// end of standard utility declarations
///////////////////////////////////////


///////////////////////////////////////
// struct/message declarations

typedef enum {
    WasmBotsMessage_MessageType___NullMessage = 0,
    WasmBotsMessage_MessageType_GameCircumstances = 1,
    WasmBotsMessage_MessageType_PlayerMove = 2
} WasmBotsMessage_MessageType;

WasmBotsMessage_MessageType WasmBotsMessage_GetMessageType(const void* m);
WasmBotsMessage_err_t WasmBotsMessage_GetSizeInBytes(const void* m, size_t* len);
WasmBotsMessage_err_t WasmBotsMessage_ProcessRawBytes(WasmBotsMessage_DataAccess* r, void*** msgListOut, size_t* len);
WasmBotsMessage_err_t WasmBotsMessage_DestroyMessageList(void** msgList, size_t len);

typedef struct {
    WasmBotsMessage_MessageType _mt;
    uint32_t lastTickDuration;
    bool lastMoveSucceeded;
} WasmBotsMessage_GameCircumstances;
extern const WasmBotsMessage_GameCircumstances WasmBotsMessage_GameCircumstances_default;

WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_WriteBytes(WasmBotsMessage_DataAccess* w, const WasmBotsMessage_GameCircumstances* src, bool tag);
WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_FromBytes(WasmBotsMessage_DataAccess* r, WasmBotsMessage_GameCircumstances* dst);
WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_GetSizeInBytes(const WasmBotsMessage_GameCircumstances* m, size_t* size);
WasmBotsMessage_GameCircumstances* WasmBotsMessage_GameCircumstances_Create();
void WasmBotsMessage_GameCircumstances_Destroy(WasmBotsMessage_GameCircumstances *m);


typedef struct {
    WasmBotsMessage_MessageType _mt;
    uint8_t moveByte;
} WasmBotsMessage_PlayerMove;
extern const WasmBotsMessage_PlayerMove WasmBotsMessage_PlayerMove_default;

WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_WriteBytes(WasmBotsMessage_DataAccess* w, const WasmBotsMessage_PlayerMove* src, bool tag);
WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_FromBytes(WasmBotsMessage_DataAccess* r, WasmBotsMessage_PlayerMove* dst);
WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_GetSizeInBytes(const WasmBotsMessage_PlayerMove* m, size_t* size);
WasmBotsMessage_PlayerMove* WasmBotsMessage_PlayerMove_Create();
void WasmBotsMessage_PlayerMove_Destroy(WasmBotsMessage_PlayerMove *m);


// end of struct/message declarations
///////////////////////////////////////


#ifdef WASMBOTSMESSAGE_IMPLEMENTATION

//////////////////////////////////////////////////////////////////////////////
//
//   IMPLEMENTATION
//


///////////////////////////////////////
// standard utility definitions

bool WasmBotsMessage_IsFinished(WasmBotsMessage_DataAccess *r) {
    return r->position >= r->bufferSize;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadUInt8(WasmBotsMessage_DataAccess *r, uint8_t *ui8) {
    if (r->bufferSize < r->position + 1) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(ui8, r->buffer + r->position, 1);
    r->position += 1;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadBool(WasmBotsMessage_DataAccess *r, bool *b) {
    uint8_t byteVal;
    WasmBotsMessage_err_t err = WasmBotsMessage__ReadUInt8(r, &byteVal);
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    *b = byteVal > 0;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadInt16(WasmBotsMessage_DataAccess *r, int16_t *i16) {
    if (r->bufferSize < r->position + 2) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(i16, r->buffer + r->position, 2);
    r->position += 2;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadUInt16(WasmBotsMessage_DataAccess *r, uint16_t *ui16) {
    if (r->bufferSize < r->position + 2) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(ui16, r->buffer + r->position, 2);
    r->position += 2;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadInt32(WasmBotsMessage_DataAccess *r, int32_t *i32) {
    if (r->bufferSize < r->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(i32, r->buffer + r->position, 4);
    r->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadUInt32(WasmBotsMessage_DataAccess *r, uint32_t *ui32) {
    if (r->bufferSize < r->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(ui32, r->buffer + r->position, 4);
    r->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadInt64(WasmBotsMessage_DataAccess *r, int64_t *i64) {
    if (r->bufferSize < r->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(i64, r->buffer + r->position, 8);
    r->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadUInt64(WasmBotsMessage_DataAccess *r, uint64_t *ui64) {
    if (r->bufferSize < r->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(ui64, r->buffer + r->position, 8);
    r->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadFloat(WasmBotsMessage_DataAccess *r, float *f) {
    if (r->bufferSize < r->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(f, r->buffer + r->position, 4);
    r->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadDouble(WasmBotsMessage_DataAccess *r, double *d) {
    if (r->bufferSize < r->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(d, r->buffer + r->position, 8);
    r->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__ReadString(WasmBotsMessage_DataAccess *r, char **s, uint8_t *len) {
    WasmBotsMessage_err_t err;
    err = WasmBotsMessage__ReadUInt8(r, len);
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    if (r->bufferSize < r->position + *len) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    *s = (char*)calloc(1, (size_t)(*len + 1));
    if (*s == NULL) { return WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE; }
    memcpy(*s, r->buffer + r->position, *len);
    r->position += *len;
    return WASMBOTSMESSAGE_ERR_OK;
}



WasmBotsMessage_err_t WasmBotsMessage__WriteUInt8(WasmBotsMessage_DataAccess *w, const uint8_t *ui8) {
    if (w->bufferSize < w->position + 1) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, ui8, 1);
    w->position += 1;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteBool(WasmBotsMessage_DataAccess *w, const bool *b) {
    WasmBotsMessage_err_t err;
    uint8_t byteVal = (uint8_t)(*b ? 1 : 0);
    err = WasmBotsMessage__WriteUInt8(w, &byteVal);
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteInt16(WasmBotsMessage_DataAccess *w, const int16_t *i16) {
    if (w->bufferSize < w->position + 2) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, i16, 2);
    w->position += 2;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteUInt16(WasmBotsMessage_DataAccess *w, const uint16_t *ui16) {
    if (w->bufferSize < w->position + 2) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, ui16, 2);
    w->position += 2;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteInt32(WasmBotsMessage_DataAccess *w, const int32_t *i32) {
    if (w->bufferSize < w->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, i32, 4);
    w->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteUInt32(WasmBotsMessage_DataAccess *w, const uint32_t *ui32) {
    if (w->bufferSize < w->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, ui32, 4);
    w->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteInt64(WasmBotsMessage_DataAccess *w, const int64_t *i64) {
    if (w->bufferSize < w->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, i64, 8);
    w->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteUInt64(WasmBotsMessage_DataAccess *w, const uint64_t *ui64) {
    if (w->bufferSize < w->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, ui64, 8);
    w->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteFloat(WasmBotsMessage_DataAccess *w, const float *f) {
    if (w->bufferSize < w->position + 4) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, f, 4);
    w->position += 4;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteDouble(WasmBotsMessage_DataAccess *w, const double *d) {
    if (w->bufferSize < w->position + 8) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, d, 8);
    w->position += 8;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage__WriteString(WasmBotsMessage_DataAccess *w, char* const *s, const uint8_t *len) {
    WasmBotsMessage_err_t err;
    err = WasmBotsMessage__WriteUInt8(w, len);
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    if (w->bufferSize < w->position + *len) {
        return WASMBOTSMESSAGE_ERR_EOF;
    }
    memcpy(w->buffer + w->position, *s, *len);
    w->position += *len;
    return WASMBOTSMESSAGE_ERR_OK;
}

// end of standard utility definitions
///////////////////////////////////////


///////////////////////////////////////
// struct/message definitions

WasmBotsMessage_MessageType WasmBotsMessage_GetMessageType(const void* m) {
    const uint8_t* buffer = (const uint8_t*)m;
    uint8_t msgType = buffer[0];
    if (msgType > 2) {
        return WasmBotsMessage_MessageType___NullMessage;
    }
    return (WasmBotsMessage_MessageType)msgType;
}

WasmBotsMessage_err_t WasmBotsMessage_GetSizeInBytes(const void* m, size_t* len) {
    WasmBotsMessage_MessageType msgType = WasmBotsMessage_GetMessageType(m);
    switch (msgType) {
    case WasmBotsMessage_MessageType___NullMessage:
        return WASMBOTSMESSAGE_ERR_INVALID_DATA;
        break;
    case WasmBotsMessage_MessageType_GameCircumstances:
        return WasmBotsMessage_GameCircumstances_GetSizeInBytes((const WasmBotsMessage_GameCircumstances*)m, len);
        break;
    case WasmBotsMessage_MessageType_PlayerMove:
        return WasmBotsMessage_PlayerMove_GetSizeInBytes((const WasmBotsMessage_PlayerMove*)m, len);
        break;
    }
    return WASMBOTSMESSAGE_ERR_INVALID_DATA;
}

WasmBotsMessage_err_t WasmBotsMessage_ProcessRawBytes(WasmBotsMessage_DataAccess* r, void*** msgListDst, size_t* len) {
    WasmBotsMessage_err_t err = WASMBOTSMESSAGE_ERR_OK;
    size_t currCapacity = 8;
    *msgListDst = (void**)malloc(sizeof(void*) * currCapacity);
    if (*msgListDst == NULL) { return WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE; }
    *len = 0;
    while (!WasmBotsMessage_IsFinished(r)) {
        while (*len >= currCapacity) {
            currCapacity *= 2;
            *msgListDst = (void**)realloc(*msgListDst, (sizeof(void*) * currCapacity));
            if (*msgListDst == NULL) { return WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE; }
        }
        uint8_t msgType;
        WasmBotsMessage__ReadUInt8(r, &msgType);
        if (err != WASMBOTSMESSAGE_ERR_OK) {
            return err;
        }

        void* out;
        switch (msgType) {
        case WasmBotsMessage_MessageType_GameCircumstances:
            out = malloc(sizeof(WasmBotsMessage_GameCircumstances));
            if (out == NULL) { return WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE; }
            err = WasmBotsMessage_GameCircumstances_FromBytes(r, (WasmBotsMessage_GameCircumstances*)out);
            (*msgListDst)[*len] = out;
            *len += 1;
            if (err != WASMBOTSMESSAGE_ERR_OK) {
                return err;
            }
            break;
        case WasmBotsMessage_MessageType_PlayerMove:
            out = malloc(sizeof(WasmBotsMessage_PlayerMove));
            if (out == NULL) { return WASMBOTSMESSAGE_ERR_ALLOCATION_FAILURE; }
            err = WasmBotsMessage_PlayerMove_FromBytes(r, (WasmBotsMessage_PlayerMove*)out);
            (*msgListDst)[*len] = out;
            *len += 1;
            if (err != WASMBOTSMESSAGE_ERR_OK) {
                return err;
            }
            break;
        default:
            return WASMBOTSMESSAGE_ERR_INVALID_DATA;
            break;
        }
    }
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage_DestroyMessageList(void** msgList, size_t len) {
    for (size_t i = 0; i < len; i++) {
        WasmBotsMessage_MessageType msgType = WasmBotsMessage_GetMessageType(msgList[i]);
        switch (msgType) {
        case WasmBotsMessage_MessageType_GameCircumstances:
            WasmBotsMessage_GameCircumstances_Destroy((WasmBotsMessage_GameCircumstances*)msgList[i]);
            break;
        case WasmBotsMessage_MessageType_PlayerMove:
            WasmBotsMessage_PlayerMove_Destroy((WasmBotsMessage_PlayerMove*)msgList[i]);
            break;
        case WasmBotsMessage_MessageType___NullMessage:
            return WASMBOTSMESSAGE_ERR_INVALID_DATA;
        }
    }
    free(msgList);
    return WASMBOTSMESSAGE_ERR_OK;
}

const WasmBotsMessage_GameCircumstances WasmBotsMessage_GameCircumstances_default = {
    ._mt = WasmBotsMessage_MessageType_GameCircumstances,
    .lastTickDuration = 0,
    .lastMoveSucceeded = false,
};

WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_GetSizeInBytes(const WasmBotsMessage_GameCircumstances* m, size_t* size) {
    *size = 5;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_GameCircumstances* WasmBotsMessage_GameCircumstances_Create() {
    WasmBotsMessage_GameCircumstances* out = malloc(sizeof(WasmBotsMessage_GameCircumstances));
    if (out == NULL) { return NULL; }
    out->_mt = WasmBotsMessage_MessageType_GameCircumstances;
    out->lastTickDuration = WasmBotsMessage_GameCircumstances_default.lastTickDuration;
    out->lastMoveSucceeded = WasmBotsMessage_GameCircumstances_default.lastMoveSucceeded;
    return out;
}

void WasmBotsMessage_GameCircumstances_Destroy(WasmBotsMessage_GameCircumstances *m) {
    free(m);
}

WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_FromBytes(WasmBotsMessage_DataAccess* r, WasmBotsMessage_GameCircumstances* dst) {
    dst->_mt = WasmBotsMessage_MessageType_GameCircumstances;
    WasmBotsMessage_err_t err;
    err = WasmBotsMessage__ReadUInt32(r, &(dst->lastTickDuration));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    err = WasmBotsMessage__ReadBool(r, &(dst->lastMoveSucceeded));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage_GameCircumstances_WriteBytes(WasmBotsMessage_DataAccess* w, const WasmBotsMessage_GameCircumstances* src, bool tag) {
    WasmBotsMessage_err_t err;
    if (tag) {
        err = WasmBotsMessage__WriteUInt8(w, (const uint8_t *)&(src->_mt));
        if (err != WASMBOTSMESSAGE_ERR_OK) {
            return err;
        }
    }
    err = WasmBotsMessage__WriteUInt32(w, &(src->lastTickDuration));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    err = WasmBotsMessage__WriteBool(w, &(src->lastMoveSucceeded));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    return WASMBOTSMESSAGE_ERR_OK;
}

const WasmBotsMessage_PlayerMove WasmBotsMessage_PlayerMove_default = {
    ._mt = WasmBotsMessage_MessageType_PlayerMove,
    .moveByte = 0,
};

WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_GetSizeInBytes(const WasmBotsMessage_PlayerMove* m, size_t* size) {
    *size = 1;
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_PlayerMove* WasmBotsMessage_PlayerMove_Create() {
    WasmBotsMessage_PlayerMove* out = malloc(sizeof(WasmBotsMessage_PlayerMove));
    if (out == NULL) { return NULL; }
    out->_mt = WasmBotsMessage_MessageType_PlayerMove;
    out->moveByte = WasmBotsMessage_PlayerMove_default.moveByte;
    return out;
}

void WasmBotsMessage_PlayerMove_Destroy(WasmBotsMessage_PlayerMove *m) {
    free(m);
}

WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_FromBytes(WasmBotsMessage_DataAccess* r, WasmBotsMessage_PlayerMove* dst) {
    dst->_mt = WasmBotsMessage_MessageType_PlayerMove;
    WasmBotsMessage_err_t err;
    err = WasmBotsMessage__ReadUInt8(r, &(dst->moveByte));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    return WASMBOTSMESSAGE_ERR_OK;
}

WasmBotsMessage_err_t WasmBotsMessage_PlayerMove_WriteBytes(WasmBotsMessage_DataAccess* w, const WasmBotsMessage_PlayerMove* src, bool tag) {
    WasmBotsMessage_err_t err;
    if (tag) {
        err = WasmBotsMessage__WriteUInt8(w, (const uint8_t *)&(src->_mt));
        if (err != WASMBOTSMESSAGE_ERR_OK) {
            return err;
        }
    }
    err = WasmBotsMessage__WriteUInt8(w, &(src->moveByte));
    if (err != WASMBOTSMESSAGE_ERR_OK) {
        return err;
    }
    return WASMBOTSMESSAGE_ERR_OK;
}


// end of struct/message definitions
///////////////////////////////////////


//
//   END OF IMPLEMENTATION
//
//////////////////////////////////////////////////////////////////////////////

#endif // WASMBOTSMESSAGE_IMPLEMENTATION

#ifdef __cplusplus
}
#endif

#endif // INCLUDE_WASMBOTSMESSAGE_H
