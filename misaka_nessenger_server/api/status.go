package api

import "github.com/gin-gonic/gin"

func Status(c *gin.Context) {
	var statusCode = 500
	status := getStatusJson()
	if status["status"] == "running" {
		statusCode = 200
	}
	c.JSON(statusCode, status)
}

func getStatusJson() gin.H {
	return gin.H{
		"status": "running",
		"config": getConfig(),
	}
}

func getConfig() gin.H {
	return gin.H{
		"path": gin.H{
			"upload": ConfPathUpload,
			"home":   ConfPathHome,
			"exit":   ConfPathExit,
		},
		"upload": gin.H{
			"header_key": ConfUploadHeaderKey,
		},
	}
}
