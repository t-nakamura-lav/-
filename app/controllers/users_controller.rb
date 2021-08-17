class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("id ASC").page(params[:page]).reverse_order
    # @tweet_like = @user.tweet
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to user_path(current_user.id)
    # else
    #   render :edit
  end

  def search
    # 検索オブジェクト
    @q = User.ransack(params[:q])

  end

  def result
    # 検索オブジェクト
    @q = User.ransack(params[:q])
    # 検索結果
    @results = @q.result(distinct: true)
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction, :age_status, :job_status, :challenge_contents)
  end
end