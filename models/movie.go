package models

import "github.com/jinzhu/gorm"

type Movie struct {
	gorm.Model
	Name string
	Img string
	Year int
}
