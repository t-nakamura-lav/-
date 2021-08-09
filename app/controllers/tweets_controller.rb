class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    # stamp_type = Tweet.stamp_types[params[:tweet][:stamp_type]]
    # @tweet.stamp_type = stamp_type
    # binding.pry
    @tweet.save
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

  def to_log
  end

  def complete
  end


  private

  def tweet_params
  	params.require(:tweet).permit(:time, :tweet, :challenge)
  end

end
