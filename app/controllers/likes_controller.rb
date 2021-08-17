class LikesController < ApplicationController

  def create
    # @tweet_like = @user.tweet
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.new(tweet_id: @tweet.id)
    like.save
    # redirect_to tweet_path(tweet) 非同期通信化
    # app/views/likes/create.js.erbを参照
  end

  def destroy
    # @tweet_like = @user.tweet
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet_id: @tweet.id)
    like.destroy
    # redirect_to tweet_path(tweet) 非同期通信化
    # app/views/likes/destroy.js.erbを参照
  end

end
