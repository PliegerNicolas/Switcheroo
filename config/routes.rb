Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments do
    resources :orders, only: [:new]
  end
  
  get '/profile', to: 'users#profile'
  
  resources :orders, only: [:show]

  devise_for :users
  resources :users
end
