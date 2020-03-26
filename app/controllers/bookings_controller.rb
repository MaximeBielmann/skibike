class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  
  def create
    @participants = Schedule.find(params[:schedule_id]).schedule_current_participants
    @booking = Booking.create user_id: current_user.id, schedule_id: params[:schedule_id], booking_participants: params[:participants]
    @schedule = Schedule.update(params[:schedule_id], schedule_current_participants: @participants.to_i + params[:participants].to_i)
    
    @schedules = Schedule.where(schedule_date: @booking.schedule.schedule_date).where.not(mountain_id: @booking.schedule.mountain.id)
    @schedules.update(available_schedule: false)
  end
  
  def update
    @booking = Booking.find(params[:id]).update(booking_participants: params[:participants])
    @participants = Schedule.find(params[:schedule_id]).schedule_current_participants
    @schedule = Schedule.update(params[:schedule_id], schedule_current_participants: @participants.to_i - params[:participants].to_i)
  end
  
  def destroy
    @schedule_participants = Schedule.find(params[:schedule_id]).schedule_current_participants
    @booking_participants = Booking.find(params[:id]).booking_participants
    
    @schedule = Schedule.update(params[:schedule_id], schedule_current_participants: @schedule_participants.to_i - @booking_participants.to_i)
    
    @schedules = Schedule.where(schedule_date: @booking.schedule.schedule_date).where.not(mountain_id: @booking.schedule.mountain.id)
    @schedules.update(available_schedule: true)
    
    @booking = Booking.find(params[:id]).destroy
  end
end
