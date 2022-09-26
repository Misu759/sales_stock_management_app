Rails.application.routes.draw do
  root 'home#index'
  resources :menus
  resources :sales do
    collection do
      get 'search'
    end
  end
  resources :ingredients do
    collection do
      get 'search'
    end
  end
  resources :purchases
  resources :wastes, except: [:show]
end