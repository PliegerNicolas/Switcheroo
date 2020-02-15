Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments
  resources :users
  devise_for :users
end
