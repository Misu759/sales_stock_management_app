Rails.application.routes.draw do
  root 'home#index'
  resources :menus, only: %i[index show]
end