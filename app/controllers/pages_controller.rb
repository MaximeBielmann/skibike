class PagesController < ApplicationController
  before_action :authenticate_user!, :only => [:admin]
  def home
    @mountains = Mountain.all
  end

  def admin
    @mountains = Mountain.all
    @schedules = Schedule.all
    @bookings = Booking.all
  end
  
  def shop
  end
  
  def booking
  end
  
  def contact
  end
end
