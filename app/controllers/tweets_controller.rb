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
      redirect_to tweets_path, notice:"Tweetを投稿しました！"
    end
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(params.require(:tweet).permit(:content))
      redirect_to tweets_path, notice:"Tweetを更新しました！"
    end
  end
  
  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.delete
      redirect_to tweets_path, notice:"Tweetを削除しました！"
    end
  end
end
