class Schedule < ApplicationRecord
  belongs_to :mountain
  has_many :bookings, dependent: :destroy
end