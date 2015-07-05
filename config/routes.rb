Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  post 'login' => 'home#login'

  resources :games, except: [:edit, :update, :destroy] do
    get 'start', on: :collection
  end

  resources :users, only: [:index], defaults: { format: :json }
  resources :movies, only: [:index], defaults: { format: :json }
end