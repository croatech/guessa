package models

type User struct {
	gorm.Model
	Name string
}
