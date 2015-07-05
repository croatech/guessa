Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  get 'select_game' => 'pages#select_game'

  post 'login' => 'home#login'

  resources :games, except: [:edit, :update, :destroy], defaults: { format: :json } do
    get 'start', on: :collection
  end

  resources :users, only: [:index], defaults: { format: :json }
  resources :movies, only: [:index], defaults: { format: :json }
end