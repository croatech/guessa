package controllers

import (
	"fmt"
	"github.com/julienschmidt/httprouter"
	"html/template"
	"net/http"
)

func Hello(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
	fmt.Fprintf(w, "Hello, %s!\n", ps.ByName("name"))
}

func Login(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	fmt.Println("method:", r.Method) // get request method
	if r.Method == "GET" {
		t, _ := template.ParseFiles("templates/login.tmpl")
		t.Execute(w, nil)
	} else {
		r.ParseForm()
		fmt.Println("username:", r.Form["username"])
		fmt.Println("password:", r.Form["password"])
	}
}
