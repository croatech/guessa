package controllers

import (
	"github.com/julienschmidt/httprouter"
	"html/template"
	"net/http"
)

var actorsTmpl = template.Must(template.New("index").ParseFiles("./templates/layouts/layout.tmpl", "./templates/movies/index.tmpl"))

func ActorsIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	actorsTmpl.ExecuteTemplate(w, "layout", "Movies") // Movies - title {{.}}
}