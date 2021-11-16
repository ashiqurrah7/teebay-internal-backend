Rails.application.routes.draw do
  resources :category_products
  resources :conversations
  resources :messages
  resources :categories
  resources :products
  resources :users
  get '/user/me', to: "users#me"
  use_doorkeeper
  
  mount ActionCable.server, at: '/cable'
end
