class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order("id ASC").page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
      flash[:notice] = "登録しました！"
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = "登録に失敗しました"
      render :edit
    end
  end

  def search
    # 検索オブジェクト
    @q = User.ransack(params[:q])
  end

  def result
    if params[:q][:job_status_eq] == "0"
      params[:q][:job_status_eq] = ""
    end
    # 検索オブジェクト
    @q = User.ransack(params[:q])
    # 検索結果
    @results = @q.result(distinct: true).page(params[:page]).reverse_order
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,
                                 :introduction, :age_status, :job_status, :challenge_contents)
  end
end
