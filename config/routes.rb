Rails.application.routes.draw do
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'home#index'

    resources :games, except: [:destroy, :edit] do
      get 'start', on: :collection
    end
  end

  get '/language/:name' => 'home#switch_language', as: "switch_language"

  post 'login' => 'home#login'

  resources :users, only: :index do
    get :session_destroy, on: :collection, as: "session_destroy"
  end

  resources :movies, only: :index, defaults: { format: :json }
end