package main

import (
	"config"
	"database/sql"
	"fmt"
	"github.com/frylock13/phoenix/app/config"
	"github.com/frylock13/phoenix/app/models"
	"github.com/jinzhu/gorm"
	"github.com/julienschmidt/httprouter"
	_ "github.com/lib/pq"
	"html/template"
	"log"
	"net/http"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("app/views/index.html")
	t.Execute(w, nil)
}

func Hello(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	fmt.Fprintf(w, "Hello, %s!\n", ps.ByName("name"))
}

func Login(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	fmt.Println("method:", r.Method) // get request method
	if r.Method == "GET" {
		t, _ := template.ParseFiles("app/views/login.html")
		t.Execute(w, nil)
	} else {
		r.ParseForm()
		fmt.Println("username:", r.Form["username"])
		fmt.Println("password:", r.Form["password"])
	}
}

func main() {
	db, err := sql.Open("postgres", "host=localhost user=flamingo dbname=flamingo password=flamingo sslmode=verify-full")
	if err != nil {
		log.Fatal(err)
	}

	age := 21
	rows, err := db.Query("SELECT name FROM users WHERE age = $1", age)

	router := httprouter.New()
	router.GET("/", Index)
	router.GET("/hello/:name", Hello)
	router.GET("/login", Login)
	router.POST("/login", Login)

	log.Fatal(http.ListenAndServe(":3001", router))
	log.Println("Listening...")
}
