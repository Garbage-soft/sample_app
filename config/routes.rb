Rails.application.routes.draw do
  root "products#index"
  get  '/signup',  to: 'users#new'
  resources :products
  resources :users
end
