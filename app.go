package main

import (
	"./controllers"
	"./models"
	"fmt"
	"github.com/jinzhu/gorm"
	"github.com/julienschmidt/httprouter"
	_ "github.com/lib/pq"
	"log"
	"net/http"
)

func main() {
	db, err := gorm.Open("postgres", "host=localhost user=flamingo dbname=flamingo password=flamingo sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	db.DB()
	db.AutoMigrate(&models.User{})
	user := models.User{Name: "FRY"}
	db.Create(&user)

	router := httprouter.New()
	router.GET("/", controllers.HomeIndex)
	router.GET("/movies", controllers.MoviesIndex)
	router.GET("/actors", controllers.ActorsIndex)
	router.GET("/hello/:name", controllers.Hello)
	router.GET("/login", controllers.Login)
	router.POST("/login", controllers.Login)

	log.Fatal(http.ListenAndServe(":3001", router))
	fmt.Println("Listening...")
}
