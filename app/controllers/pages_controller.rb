class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:admin]
  def home
    @mountains = Mountain.all
  end

  def admin
    @mountains = Mountain.all
    @schedules = Schedule.where(schedule_current_participants: 0)
    @bookings = Schedule.all - @schedules
  end
  
  def shop
  end
  
  def booking
  end
  
  def contact
  end
end
