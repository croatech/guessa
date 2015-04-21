package main 

import (
	"fmt"
	"html/template"
	"net/http"
	"strings"
	"log"
	)

type Mux struct {
}

func(p *Mux) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path == "/" {
		sayhelloName(w, r)
		return
	} else {
		http.NotFound(w, r)
		return
	}
}

func sayhelloName(w http.ResponseWriter, r *http.Request) {
	r.ParseForm() // parse arguments, you have to call this by yourself
	fmt.Println(r.Form) // print form information in server side
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)
	fmt.Println(r.Form["url_long"])
	for k, v := range r.Form {
		fmt.Println("key", k)
		fmt.Println("val:", strings.Join(v, ""))
	}
	t,_ := template.ParseFiles("views/home.gtpl")
	t.Execute(w, nil)
}

func login(w http.ResponseWriter, r *http.Request) {
	fmt.Println("method:", r.Method) // get request method
	if r.Method == "GET" {
		t,_ := template.ParseFiles("views/login.gtpl")
		t.Execute(w, nil)
	} else {
		r.ParseForm()
		fmt.Println("username:", r.Form["username"])
		fmt.Println("password:", r.Form["password"])
	}
}

func main() {
	http.HandleFunc("/", sayhelloName)
	http.HandleFunc("/login", login)
	err := http.ListenAndServe(":9090", nil) // set listen port
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}