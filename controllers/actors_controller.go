package controllers

import (
	"github.com/julienschmidt/httprouter"
	"html/template"
	"net/http"
)

func ActorsIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	t, _ := template.ParseFiles("templates/actors/index.tmpl")
	t.Execute(w, nil)
}
