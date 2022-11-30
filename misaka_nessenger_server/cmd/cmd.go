package cmd

import (
	"MisakaNessengerServer/api"
	"fmt"
	"github.com/gin-gonic/gin"
	"os"
)

func RunServer() {
	r := gin.Default()
	r.GET("/", api.Home)
	r.GET("/home", api.Home)
	r.GET("/status", api.Status)
	r.POST("/upload", api.Upload)
	r.GET("/exit", api.ExitServer)
	err := r.Run(":10032")
	if err != nil {
		fmt.Printf("failed to start gin server: %v\n", err)
		os.Exit(1)
	}
}
