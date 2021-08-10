class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction, :age_status, :job_status, :challenge_contents)
  end
end