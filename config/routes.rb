Rails.application.routes.draw do
  root 'home#index'

  post 'login' => 'home#login'

  resources :games do
    get 'start', on: :collection
  end
  
  resources :users
end
