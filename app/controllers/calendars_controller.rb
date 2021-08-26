class CalendarsController < ApplicationController
  # calendar=スタンプのこと

  def index
    @calendars = current_user.calendars
    @calendar = Calendar.new
  end

  def create
    calendar = Calendar.new(calendar_params)
    calendar.user_id = current_user.id
    if current_user.calendars.empty?
      calendar.save!
    else
      current_user.calendars.each do |old_calendar|
        if old_calendar.start_time == calendar.start_time
          old_calendar.destroy!
          calendar.save!
        else
          calendar.save!
        end
      end
    end
    flash[:notice] = "Good Job! 今日もがんばったね!"
    redirect_to calendars_path
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :stamp_type)
  end
end
