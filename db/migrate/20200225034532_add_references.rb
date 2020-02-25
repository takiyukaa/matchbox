class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :skills, :user, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :skill, foreign_key: true
    add_reference :work_histories, :user, foreign_key: true
  end
end
