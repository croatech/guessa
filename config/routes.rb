Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  root 'home#index'

  post 'login' => 'home#login'

  resources :games, except: [:destroy, :edit] do
    get 'start', on: :collection
  end

  resources :users, only: :index do
    get :session_destroy, on: :collection, as: "session_destroy"
  end

  resources :movies, only: :index, defaults: { format: :json }
end