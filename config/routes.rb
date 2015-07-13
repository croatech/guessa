Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "orders#index"

  resources :requests
  resources :orders
end