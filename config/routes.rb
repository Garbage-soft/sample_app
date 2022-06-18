Rails.application.routes.draw do
  get 'users/new'
  root "products#index"
  resources :products
end
