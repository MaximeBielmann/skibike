class Schedule < ApplicationRecord
  belongs_to :mountain
  has_many :bookings, dependent: :destroy
  
  filterrific(
    default_filter_params: { with_schedule_date: "schedule_date" },
    available_filters: [
      :with_mountain_id,
      :with_schedule_date,
      :with_schedule_participants
    ],
  )
  
  scope :with_mountain_id, ->(mountain_ids) {
    # Filters students with any of the given country_ids
    where(mountain_id: [*mountain_ids])
  }
  
  scope :with_schedule_date, ->(date) {
    where("schedules.schedule_date == ?", date)
  }
  
end