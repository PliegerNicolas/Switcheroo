Rails.application.routes.draw do
  root 'instruments#index'
  resources :instruments
  devise_for :users
  get 'profil/:id', as: 'profil', to: 'users#profil'
  resources :users
end
