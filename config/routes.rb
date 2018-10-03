# refactor with more user friendly and secure urls

Rails.application.routes.draw do
  resources :activities
  resources :users
  resources :sessions, only: [:new, :create]
  resources :lists

  resources :users do
    resources :activities
  end

  resources :activities do
    resources :lists
  end

  # :user login => sessions#new | signup => users#new | or omniauth route
  get '/', to: "welcome#home"

  get '/account' => 'users#account', :as => 'account'

  get '/account/edit', to: 'users#edit', :as  => 'account/edit'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'

  get '/list/:id/delete', to: 'lists#destroy'

  get '/activity/:id/delete', to: 'activities#destroy'

  get '/account/delete', to: 'users#destroy'

  get '/admin/most_activities', to: 'admin#most_activities'
end
