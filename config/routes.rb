Rails.application.routes.draw do
  root "products#index"
  get  '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :products
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
