class YoutubesController < ApplicationController
  def index
    @youtubes = Youtube.all
  end

  def new
    @youtube = Youtube.new
  end

  def create
    youtube = Youtube.new(youtube_params)
    if youtube.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @youtube = Youtube.find(params[:id])
  end
  def edit
    @youtube = Youtube.find(params[:id])
  end

  def update
    youtube = Youtube.find(params[:id])
    if youtube.update(youtube_params)
      redirect_to :action => "show", :id => youtube.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    youtube = Youtube.find(params[:id])
    youtube.destroy
    redirect_to action: :index
  end

  private
  def youtube_params
    params.require(:youtube).permit(:body,:youtube_url)
  end

end
