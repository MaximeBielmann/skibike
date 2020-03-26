class MountainsController < ApplicationController
  def create
    @mountain = Mountain.create mount_title: params[:mount_title]
    
    @n = 0
    
   7.times do 
     Schedule.create mountain_id: @mountain.id, schedule_date: Date.today + @n.day, schedule_max_participants: 6, schedule_current_participants: 0
     @n += 1
   end
    
    
    redirect_to "/admin"
  end

  def update
    @mountain = Mountain.update(params[:id], mount_title: params[:mount_title])
    redirect_to "/admin"
  end

  def destroy
    @mountain = Mountain.find(params[:id]).destroy
    redirect_to "/admin"
  end
end