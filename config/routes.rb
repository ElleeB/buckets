Rails.application.routes.draw do
  resources :bucket_items
  resources :users

  # :user login => sessions#new | signup => users#new | or omniauth route

  get '/', to: "welcome#home"
end
