package api

import (
	"MisakaNessengerServer/common"
	"MisakaNessengerServer/core"
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"mime/multipart"
	"os"
	"runtime"
)

func Upload(c *gin.Context) {
	var file *multipart.FileHeader
	var err error
	log.Println("AAAA GET UPLOAD")

	// The tmp file path used by c.FormFile in os.file_unix.go is "/data/local/tmp" on Android,
	// which is inaccessible without root privilege, correct it before call FormFile.
	if runtime.GOOS == "android" {
		core.SetAndroidTmpDirEnv(os.Getenv(common.AndroidTmpDirEnvName))
		file, err = c.FormFile("file")
		core.ResetAndroidTmpDirEnv()
	} else {
		file, err = c.FormFile("file")
	}
	if err != nil {
		log.Printf("failed to get file in upload context: %v\n", err)
		return
	}
	saveFilePath, err := getFileSavePath(file.Filename)
	if err != nil {
		c.String(500, "Server can not get save path for file %s", file.Filename)
		fmt.Printf("Server can not get save path for file %s\n", file.Filename)
		return
	}
	log.Println("AAAA START SAVE")
	err = c.SaveUploadedFile(file, saveFilePath)
	log.Println("AAAA FINISH SAVE")
	if err != nil {
		c.String(500, "Server failed to save file %s to %s", file.Filename, saveFilePath)
		fmt.Printf("Server failed to save file %s to %s\n", file.Filename, saveFilePath)
		return
	}
	c.String(200, "Success")
	fmt.Printf("success for file %s\n", saveFilePath)
}

func getFileSavePath(fileName string) (string, error) {
	switch runtime.GOOS {
	case "android":
		return "/storage/emulated/0/Download/MisakaNessenger/" + fileName, nil
	default:
		p, err := os.UserHomeDir()
		if err != nil {
			return "", nil
		}
		return fmt.Sprintf("%s%c%s%c%s", p, os.PathSeparator, "Downloads", os.PathSeparator, fileName), nil
	}
}
