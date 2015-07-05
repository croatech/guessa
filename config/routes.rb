Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  post 'login' => 'home#login'

  resources :games, except: [:edit, :destroy] do
    get 'start', on: :collection
  end

  resources :users, only: [:index, :show], defaults: { format: :json }
  resources :movies, only: [:index, :show], defaults: { format: :json }
end