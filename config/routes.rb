Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  post 'login' => 'home#login'

  resources :games, except: [:edit] do
    get 'start', on: :collection
  end

  resources :users, only: [:index, :show], defaults: { format: :json } do
    resources :games, only: [:index, :update]
  end

  resources :movies, only: [:index]
end