Rails.application.routes.draw do
  
  devise_for :users

  resources :users, only: [:show]
  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :tweets do
  resources :likes, only: [:create, :destroy]
  end
end