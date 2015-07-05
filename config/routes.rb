Rails.application.routes.draw do
  root 'home#index'

  get 'select_game' => 'pages#select_game'

  post 'login' => 'home#login'

  resources :games do
    get 'start', on: :collection
  end

  resources :users
end
