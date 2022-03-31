package main

import "github.com/gin-gonic/gin"

// var csv_path = "./myfile.csv"

func main() {

	r := gin.Default()

	r.GET("/hello", func(c *gin.Context) {
		c.String(200, "Hello, World!")
	})

	r.GET("/", func(c *gin.Context) {
		c.String(200, "boy im stanced up!!!")
	})

	r.Run(":80")
}
