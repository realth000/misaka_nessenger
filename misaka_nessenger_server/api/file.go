package api

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"os"
	"runtime"
)

func Upload(c *gin.Context) {
	log.Println("AAAA GET UPLOAD")
	file, err := c.FormFile("file")
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
