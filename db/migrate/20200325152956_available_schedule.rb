class AvailableSchedule < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :available_schedule, :boolean, default: true
  end
end
