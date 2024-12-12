package wasmbot_trainer

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"unsafe"
)

const CHATTY_SERVER bool = true

type BotImplementation struct {
	ClientInitializeFunc     func()
	SetupFunc                func(uintptr) uintptr
	ReceiveGameParamsFunc    func(uintptr) bool
	TickFunc                 func(uintptr)
	HostLogFunction          *func(int32, uintptr, uintptr)
	HostGetRandomIntFunction *func(int32, int32) int32
}

type SetupRequest struct {
	Reserve int `json:"reserve"`
}

type MemoryRequest struct {
	Offset int    `json:"offset"`
	Mem    string `json:"mem"`
}

type MemoryResult struct {
	Success bool   `json:"success"`
	Mem     string `json:"mem"`
}

var botImpl BotImplementation

func TrainerMain(impl BotImplementation) {
	botImpl = impl

	setupHarness()

	http.HandleFunc("/setup", setupHandler)
	http.HandleFunc("/receiveGameParams", receiveGameParamsHandler)
	http.HandleFunc("/tick", tickHandler)

	fmt.Printf("Listening...\n\n")
	err := http.ListenAndServe(":9090", nil)
	if err != nil {
		os.Exit(1)
	}
}

func setupHandler(w http.ResponseWriter, r *http.Request) {
	if CHATTY_SERVER {
		fmt.Print("/setup w/")
	}
	body, err := io.ReadAll(r.Body)
	if err != nil {
		errMsg := fmt.Errorf("Error reading body: %w", err)
		fmt.Fprintf(os.Stderr, errMsg.Error())
		return
	}
	if CHATTY_SERVER {
		fmt.Printf("%s\n", body)
	}

	var setup SetupRequest
	err = json.Unmarshal(body, &setup)
	if err != nil {
		errMsg := fmt.Errorf("Error parsing JSON: %w", err)
		fmt.Fprintf(os.Stderr, errMsg.Error())
		return
	}

	reserve := simulateSetup(uintptr(setup.Reserve))

	if reserve == 0 {
		w.WriteHeader(http.StatusInternalServerError)
		io.WriteString(w, "Could not allocate reserve block")
		return
	}

	if CHATTY_SERVER {
		fmt.Println("  [SUCCESS!]")
	}

	reserveBlock := unsafe.Slice((*byte)(unsafe.Pointer(reserve)), setup.Reserve)
	w.Header().Add("Content-Type", "application/octet-stream")
	w.Write(reserveBlock)
}

func sendJsonMemResponse(w http.ResponseWriter, code int, success bool, msg string) {
	data := MemoryResult{
		Success: success,
		Mem:     msg,
	}
	body, err := json.Marshal(data)
	if err != nil {
		errMsg := fmt.Errorf("Could not marshal data: %w", err)
		fmt.Fprintf(os.Stderr, errMsg.Error())
		w.WriteHeader(500)
		return
	}
	w.WriteHeader(code)
	w.Header().Add("Content-Type", "application/json")
	w.Write(body)
}

func receiveGameParamsHandler(w http.ResponseWriter, r *http.Request) {
	if CHATTY_SERVER {
		fmt.Print("/receiveGameParams w/")
	}
	body, err := io.ReadAll(r.Body)
	if err != nil {
		errMsg := fmt.Errorf("Error reading body: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}
	if CHATTY_SERVER {
		fmt.Printf("%s\n", body)
	}

	var memReq MemoryRequest
	err = json.Unmarshal(body, &memReq)
	if err != nil {
		errMsg := fmt.Errorf("Error parsing JSON: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}

	decodedBuffer, err := base64.StdEncoding.DecodeString(memReq.Mem)
	if err != nil {
		errMsg := fmt.Errorf("Error decoding memory string: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}

	updatedBuffer := simulateReceiveGameParams(decodedBuffer, uintptr(memReq.Offset))

	if updatedBuffer == nil {
		sendJsonMemResponse(w, 400, false, "Bot declined game parameters")
		return
	}

	encodedMem := base64.StdEncoding.EncodeToString(updatedBuffer)
	sendJsonMemResponse(w, 200, true, encodedMem)
}

func tickHandler(w http.ResponseWriter, r *http.Request) {
	if CHATTY_SERVER {
		fmt.Print("/tick w/")
	}
	body, err := io.ReadAll(r.Body)
	if err != nil {
		errMsg := fmt.Errorf("Error reading body: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}
	if CHATTY_SERVER {
		fmt.Printf("%s\n", body)
	}

	var memReq MemoryRequest
	err = json.Unmarshal(body, &memReq)
	if err != nil {
		errMsg := fmt.Errorf("Error parsing JSON: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}

	decodedBuffer, err := base64.StdEncoding.DecodeString(memReq.Mem)
	if err != nil {
		errMsg := fmt.Errorf("Error decoding memory string: %w", err)
		sendJsonMemResponse(w, 400, false, errMsg.Error())
		return
	}

	updatedBuffer := simulateTick(decodedBuffer, uintptr(memReq.Offset))

	encodedMem := base64.StdEncoding.EncodeToString(updatedBuffer)
	sendJsonMemResponse(w, 200, true, encodedMem)
}
