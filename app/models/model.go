package models

import (
	"github.com/frylock13/phoenix/app/models"
	"github.com/jinzhu/gorm"
	_ "github.com/lib/pq"
)

type Model struct {
	ID        uint `gorm:"primary_key"`
	CreatedAt time.Time
	UpdatedAt time.Time
	DeletedAt *time.Time
}
