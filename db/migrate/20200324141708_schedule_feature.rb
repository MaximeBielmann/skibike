class ScheduleFeature < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules
    add_column :schedules, :mountain_id, :integer
    add_column :schedules, :schedule_date, :datetime
    add_column :schedules, :schedule_max_participants, :integer
    add_column :schedules, :schedule_current_participants, :integer
  end
end
