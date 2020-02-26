class ChangeDefaultStatusToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :status, from: false, to: "pending"
  end
end
