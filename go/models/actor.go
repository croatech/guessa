package models

import "github.com/jinzhu/gorm"

type Actor struct {
	gorm.Model
	Name string
	Img string
}
