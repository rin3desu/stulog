class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_back(fallback_location: tweet_path(@tweet))
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_back(fallback_location: tweet_path(@tweet))
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
