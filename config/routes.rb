# refactor with more user friendly and secure urls

Rails.application.routes.draw do
  resources :to_do_lists
  resources :bucket_items
  resources :users
  resources :sessions, only: [:new, :create]

  # :user login => sessions#new | signup => users#new | or omniauth route
  get '/', to: "welcome#home"

  get '/account' => 'users#account', :as => 'account'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
end
