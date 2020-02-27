Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'instruments#index'
  resources :instruments do
    post 'favorite', to: 'instruments#favorite'
    resources :orders, only: [:new]
  end

  get '/dashboard', to: 'users#dashboard'

  resources :orders, only: [:destroy]


end
