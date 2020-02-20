Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments
  devise_for :users
  resources :users
end
