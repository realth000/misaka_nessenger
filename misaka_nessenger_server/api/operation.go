package api

import (
	"github.com/gin-gonic/gin"
	"os"
	"time"
)

func ExitServer(c *gin.Context) {
	c.String(200, "stop server success")
	go exitServer()
}

func exitServer() {
	time.Sleep(time.Millisecond * 500)
	os.Exit(0)
}
