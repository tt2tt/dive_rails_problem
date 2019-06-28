class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
     @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice:"Tweetを投稿しました！"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice:"Tweetを更新しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    if @tweet.delete
      redirect_to tweets_path, notice:"Tweetを削除しました！"
    end
  end
  
  def confirm
    @tweet = Tweet.new(tweet_params)
  end
  
  private
  
  def tweet_params
      params.require(:tweet).permit(:content)
  end
  
  def set_tweet
      @tweet = Tweet.find(params[:id])
  end
end
