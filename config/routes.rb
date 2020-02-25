Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments do
    post 'favorite', to: 'instruments#favorite'
    resources :orders, only: [:new]
  end

  get '/dashboard', to: 'users#dashboard'

  resources :orders, only: [:show, :destroy]

  devise_for :users
  resources :users
end
