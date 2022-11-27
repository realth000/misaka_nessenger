package cmd

import (
	"MisakaNessengerServer/api"
	"github.com/gin-gonic/gin"
)

func RunServer() {
	r := gin.Default()
	r.POST("/upload", api.Upload)
	r.GET("/", api.Home)
	r.GET("/home", api.Home)
	r.Run(":10032")
}
