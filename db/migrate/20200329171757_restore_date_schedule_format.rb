class RestoreDateScheduleFormat < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :schedule_date, :datetime
  end
end
