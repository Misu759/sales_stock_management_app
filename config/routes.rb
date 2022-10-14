Rails.application.routes.draw do
  root 'home#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :menus
  resources :sales do
    collection do
      get 'search'
      get 'confirm'
    end
  end
  resources :ingredients do
    collection do
      get 'search'
    end
  end
  resources :purchases
  resources :wastes, except: %i[show]
end