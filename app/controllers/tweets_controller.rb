class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all.order(created_at: :desc).includes(:user, :likes, :comments)
    @user = current_user
    @liked_tweet_ids = current_user.likes.pluck(:tweet_id)
  end

  def new
    @tweet = Tweet.new
    @user = current_user
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save
      redirect_to tweets_path
    else
      redirect_to new_tweet_path
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to tweet_path(tweet)
    else
      redirect_to edit_tweet_path(tweet)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user).order(created_at: :asc)
    @new_comment = Comment.new
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:test, :subject, :section, :comment, :user_id, :image)
  end
end
