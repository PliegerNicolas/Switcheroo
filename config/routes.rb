Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments do
    resources :orders, only: [:new]
  end

  get '/profile', to: 'users#profile'
  devise_for :users
  resources :users
end
