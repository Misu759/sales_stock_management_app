Rails.application.routes.draw do
  root 'home#index'
  resources :menus
  resources :sales
  resources :ingredients, except: [:show]
  resources :stocks, only: %i[index show edit update delete]
  resources :purchases
end