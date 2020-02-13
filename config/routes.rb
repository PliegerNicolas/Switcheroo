Rails.application.routes.draw do
  devise_for :users
  root 'instruments#index'
end
