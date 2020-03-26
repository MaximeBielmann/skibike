class Booking < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  has_one :mountain, through: :schedule
end