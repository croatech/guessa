package main

import (
	"./models"
	"fmt"
	"github.com/jinzhu/gorm"
	"github.com/julienschmidt/httprouter"
	_ "github.com/lib/pq"
	"html/template"
	"log"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("templates/index.html")
	t.Execute(w, nil)
}

func ActorsIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("templates/actors/index.html")
	t.Execute(w, nil)
}

func MoviesIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("templates/movies/index.html")
	t.Execute(w, nil)
}

func Hello(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	fmt.Fprintf(w, "Hello, %s!\n", ps.ByName("name"))
}

func Login(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	fmt.Println("method:", r.Method) // get request method
	if r.Method == "GET" {
		t, _ := template.ParseFiles("templates/login.html")
		t.Execute(w, nil)
	} else {
		r.ParseForm()
		fmt.Println("username:", r.Form["username"])
		fmt.Println("password:", r.Form["password"])
	}
}

func main() {
	db, err := gorm.Open("postgres", "host=localhost user=flamingo dbname=flamingo password=flamingo sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}
	db.DB()
	db.AutoMigrate(&models.User{})
	user := models.User{Name: "Jinzhu"}
	db.Create(&user)

	router := httprouter.New()
	router.GET("/", Index)
	router.GET("/movies", MoviesIndex)
	router.GET("/actors", ActorsIndex)
	router.GET("/hello/:name", Hello)
	router.GET("/login", Login)
	router.POST("/login", Login)

	log.Fatal(http.ListenAndServe(":3001", router))
	log.Println("Listening...")
}
