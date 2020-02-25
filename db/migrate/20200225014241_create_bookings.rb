class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :start_time
      t.time :end_time
      t.boolean :status, default: false
      t.text :user_comment
      t.text :provider_comment

      t.timestamps
    end
  end
end
