Rails.application.routes.draw do
  
  get 'youtubes/index' => 'youtubes#index'
  get 'youtubes/new' => 'youtubes#new'
  get 'youtubes/show'
  get 'youtubes/edit'
  devise_for :users

  resources :users, only: [:show]
  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :youtubes

end