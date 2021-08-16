class CalendarsController < ApplicationController

  def show
    @calendars = Calendar.all
    @calendar = Calendar.new
  end

  def create
    Calendar.create(calendar_params)
    redirect_to calendar_path(current_user.id)
  end

  def destroy
    # Calendar.destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    flash[:notice] = "スタンプを削除しました"
    redirect_to calendar_path(current_user.id)
  end


  private

  def calendar_params
  	params.require(:calendar).permit(:start_time, :stamp_type)
  end

end
