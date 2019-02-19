# refactor with more user friendly and secure urls

Rails.application.routes.draw do
  resources :categories
  resources :activities
  resources :users
  resources :sessions, only: [:new, :create]
  resources :lists
  resources :categories, only: [:show]

  resources :users do
    resources :activities
    resources :categories
    resources :lists
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

  get '/admin/category_users', to: 'admin#category_users'

  get '/admin/category_by_name', to: 'admin#order_by_name'

  # get '/activities/4/add_list', to: 'lists#create'
end
