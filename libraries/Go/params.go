package wasmbot_client

import "fmt"

const GP_VERSION uint16 = 7
const MAX_NAME_LEN uintptr = 26

type GameParameters struct {
	ParamsVersion uint16
	EngineVersion [3]uint16
}

type BotMetadata struct {
	Name    string
	Version [3]uint16
	Ready   bool
}

type ClientSetupFunction func(GameParameters) BotMetadata

var clientSetup ClientSetupFunction = nil

func RegisterClientSetup(setup ClientSetupFunction) {
	clientSetup = setup
}

//export receiveGameParams
func receiveGameParams(offset uintptr, infoOffset uintptr) bool {
	gpVersion := ReadNumber[uint16](offset)
	offset += 2
	if gpVersion != GP_VERSION {
		LogErr(fmt.Sprintf("ERROR: Can't parse GameParams v%d; only prepared for v%d", gpVersion, GP_VERSION))
		return false
	}

	engVersion := [3]uint16{0, 0, 0}
	engVersion[0] = ReadNumber[uint16](offset)
	offset += 2
	engVersion[1] = ReadNumber[uint16](offset)
	offset += 2
	engVersion[2] = ReadNumber[uint16](offset)
	offset += 2

	gp := GameParameters{
		ParamsVersion: gpVersion,
		EngineVersion: engVersion,
	}

	botData := clientSetup(gp)

	if uintptr(len(botData.Name)) > MAX_NAME_LEN {
		copy(hostReserve[infoOffset:], botData.Name[:MAX_NAME_LEN])
	} else {
		copy(hostReserve[infoOffset:], botData.Name)
		hostReserve[infoOffset+uintptr(len(botData.Name))] = 0
	}
	infoOffset += MAX_NAME_LEN

	for i := 0; i < len(botData.Version); i++ {
		infoOffset = WriteNumber[uint16](infoOffset, botData.Version[i])
	}

	return botData.Ready
}
