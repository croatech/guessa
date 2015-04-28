package controllers

import (
	"github.com/julienschmidt/httprouter"
	"html/template"
	"net/http"
)

func MoviesIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("templates/movies/index.html")
	t.Execute(w, nil)
}
