class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.where(available_schedule: true).order(:schedule_date)
  end
  
  def create
  end

  def show
    @schedule = Schedule.find(params[:id])
    @available_slot = @schedule.schedule_max_participants - @schedule.schedule_current_participants
  end

  def update
  end

  def destroy
  end
end
