package models

import (
	"github.com/frylock13/phoenix/app/models"
	"github.com/jinzhu/gorm"
	_ "github.com/lib/pq"
)

type User struct {
	gorm.Model
	Name string
}
