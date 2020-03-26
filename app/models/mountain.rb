class Mountain < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :bookings, through: :schedules
end