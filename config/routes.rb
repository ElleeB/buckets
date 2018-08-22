Rails.application.routes.draw do
  resources :bucket_items
  resources :users

  get '/', to: "welcome#home"
end
