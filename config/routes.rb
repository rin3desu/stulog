Rails.application.routes.draw do

  get 'mypage/index' => 'mypage#index'
  
  devise_for :users

  resources :users, only: [:show]
  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :youtubes
  resources :study_records

end