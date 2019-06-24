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
end
