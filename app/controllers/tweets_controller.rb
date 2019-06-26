class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet =Tweet.new(params.require(:tweet).permit(:content))
    if @tweet.save
      redirect_to tweets_path
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(params.require(:tweet).permit(:content))
      redirect_to tweets_path
    end
  end
end
