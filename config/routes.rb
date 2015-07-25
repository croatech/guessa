Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  post 'login' => 'home#login'

  resources :games, except: :all do
    get 'start', on: :collection
  end

  resources :users, only: :index do
    resources :games, only: [:index, :update], defaults: { format: :json }
  end

  resources :movies, only: [:index], defaults: { format: :json }
end