# refactor with more user friendly and secure urls?

Rails.application.routes.draw do
  resources :to_do_items
  resources :to_do_lists
  resources :to_do_lists do
    resources :to_do_items
  end

  resources :bucket_items
  resources :users
  resources :users do
    resources :bucket_items
  end
  resources :sessions, only: [:new, :create]

  get '/', to: "welcome#home"

  get '/account' => 'users#account', :as => 'account'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
end
