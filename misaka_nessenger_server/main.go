package main

import "C"
import "github.com/gin-gonic/gin"

//export RunServer
func RunServer() {
	r := gin.Default()
	r.GET("/", func(context *gin.Context) {
		context.String(200, "Hello Misaka Nessenger Server")
	})
	r.Run(":20020")
}

func main() {
	RunServer()
}
