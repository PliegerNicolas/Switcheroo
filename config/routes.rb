Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments do
    resources :orders, only: [:new]
  end
  devise_for :users
  resources :users
end
