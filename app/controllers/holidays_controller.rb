class HolidaysController < ApplicationController

  expose(:holidays) { current_user.holidays }
  expose(:holiday, attributes: :holiday_params)

  def index; end

  def new; end

  def create
    if holiday.save
      redirect_to holidays_path, success: 'Holiday was created successfully'
    else
      render :new
    end
  end

  private

    def holiday_params
      params.require(:holiday).permit(:name, :date)
    end
end
