class DateScheduleFormat < ActiveRecord::Migration[5.2]
    def up
      change_column :schedules, :schedule_date, :datetime
    end

    def down
      change_column :schedules, :schedule_date, :string
    end
end
