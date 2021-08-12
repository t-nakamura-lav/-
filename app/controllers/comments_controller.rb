class CommentsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    # comment = Comment.new(comment_params)と
    # comment.user_id = current_user.idの省略形 ↓
    comment = current_user.comments.new(comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweet_path(tweet)
  end

  def destroy
  end


  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
