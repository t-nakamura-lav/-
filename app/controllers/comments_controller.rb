class CommentsController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
    # comment = Comment.new(comment_params)と
    # comment.user_id = current_user.idの省略形 ↓
    comment = current_user.comments.new(comment_params)
    comment.tweet_id = @tweet.id
    comment.save
    # redirect_to tweet_path(tweet) 非同期通信化
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
    Comment.find_by(id: params[:id], tweet_id: params[:tweet_id]).destroy
    # redirect_to tweet_path(params[:tweet_id]) 非同期通信化
  end


  private

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
