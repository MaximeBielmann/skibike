class FinalFixScheduleDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :schedule_date
    add_column :schedules, :schedule_date, :datetime
  end
end
