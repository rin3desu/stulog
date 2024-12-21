class TweetsController < ApplicationController

  before_action :authenticate_user! # 追加
  def index
    @tweets = Tweet.order(created_at: :desc)
    @user = current_user
  end

  #追加箇所
  def new
    @tweet = Tweet.new  #tweetモデルに新しくデータを追加している
    @user = current_user
  end

  # createアクション
  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:test, :subject, :section, :comment,:user_id,:image)
  end
end
  