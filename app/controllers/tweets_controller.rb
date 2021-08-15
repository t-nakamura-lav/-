class TweetsController < ApplicationController
  def index
    # 投稿を新着順＆ページング
    @tweets = Tweet.all.order("id ASC").page(params[:page]).reverse_order

  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = Comment.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # binding.pry
    @tweet.user_id = current_user.id
    @tweet.save!
      flash[:success] = "投稿しました"
      redirect_to complete_tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
  end

  def destroy
  end


  def complete
  end


  private

  def tweet_params
  	params.require(:tweet).permit(:time, :tweet, :challenge, :hour_attribute, :minute_attribute, images: [])
  end

end
