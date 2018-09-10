# refactor with more user friendly and secure urls

Rails.application.routes.draw do
  resources :activities
  resources :users
  resources :sessions, only: [:new, :create]
  resources :lists
  resources :items

  resources :users do
    resources :activities
  end

  resources :activities do
    resources :lists
  end

  resources :lists
    resources :items
  end

  # :user login => sessions#new | signup => users#new | or omniauth route
  get '/', to: "welcome#home"

  get '/account' => 'users#account', :as => 'account'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
end
