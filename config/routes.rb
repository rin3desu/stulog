Rails.application.routes.draw do
  
  devise_for :users

  get 'hello/index' => 'hello#index'
  root 'hello#index'

  get 'tweet/index' => 'tweets#index'  #投稿のトップページ
  
  get 'tweets/new' => 'tweets#new'  #新規投稿画面

  post 'tweets' => 'tweets#create'  #新規ツイートの保存

  get 'tweets/:id' => 'tweets#show',as: 'tweet' #各ツイートの詳細を保存

  patch 'tweets/:id' => 'tweets#update'
  delete 'tweets/:id' => 'tweets#destroy' #ここに挿入！！！

  get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'

  resources :tweets
  
end
