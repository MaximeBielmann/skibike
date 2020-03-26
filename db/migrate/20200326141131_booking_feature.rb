class BookingFeature < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings
    add_column :bookings, :user_id, :integer
    add_column :bookings, :schedule_id, :integer
    add_column :bookings, :booking_participants, :integer
    add_column :bookings, :payement_status, :boolean, default: false
  end
end
