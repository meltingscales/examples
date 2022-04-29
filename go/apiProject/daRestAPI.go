package main

import "github.com/gin-gonic/gin"

func main(){
	hostDaAPI()
}

func hostDaAPI() {

	r := gin.Default()

	r.GET("/hello", func(c *gin.Context) {
		c.String(200, "Hello, World!")
	})

	r.GET("/", func(c *gin.Context) {
		c.String(200, "boy im stanced up!!!")
	})

	r.Run(":80")
}
