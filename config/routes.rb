Rails.application.routes.draw do

  devise_for :users
  get 'mypage/index' => 'mypage#index'

  resources :deadline, only: [:new, :show,:create]
  resources :users, only: [:show]
  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :youtubes
  resources :study_records

end