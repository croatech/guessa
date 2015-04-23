package main

import (
    "fmt"
    "html/template"
    "github.com/julienschmidt/httprouter"
    "net/http"
    "log"
)

func Index(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
    t,_ := template.ParseFiles("views/index.html")
    t.Execute(w, nil)
}

func Hello(w http.ResponseWriter, r *http.Request, ps httprouter.Params) {
    fmt.Fprintf(w, "Hello, %s!\n", ps.ByName("name"))
}

func Login(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
    fmt.Println("method:", r.Method) // get request method
    if r.Method == "GET" {
        t,_ := template.ParseFiles("views/login.html")
        t.Execute(w, nil)
    } else {
        r.ParseForm()
        fmt.Println("username:", r.Form["username"])
        fmt.Println("password:", r.Form["password"])
    }
}

func main() {
    router := httprouter.New()
    router.GET("/", Index)
    router.GET("/hello/:name", Hello)
    router.GET("/login", Login)
    router.POST("/login", Login)

    log.Fatal(http.ListenAndServe(":3001", router))
    log.Println("Listening...")
}
