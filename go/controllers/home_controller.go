package controllers

import (
	"github.com/julienschmidt/httprouter"
	"html/template"
	"net/http"

)

var homeTmpl = template.Must(template.New("index").ParseFiles("./templates/layouts/layout.tmpl", "./templates/index.tmpl"))

func HomeIndex(w http.ResponseWriter, r *http.Request, _ httprouter.Params) {
	homeTmpl.ExecuteTemplate(w, "layout", "Home") // Home - title {{.}}
}
