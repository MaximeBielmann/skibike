class Mountain < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :bookings, through: :schedules
  
  def self.options_for_select
    order("LOWER(mount_title)").map { |e| [e.mount_title, e.id] }
  end
end