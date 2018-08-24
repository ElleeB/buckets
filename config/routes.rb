Rails.application.routes.draw do
  resources :bucket_items
  resources :users
  resources :sessions, only: [:new, :create]

  # :user login => sessions#new | signup => users#new | or omniauth route
  get '/', to: "welcome#home"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  get '/logout', to: "sessions#destroy"
end
