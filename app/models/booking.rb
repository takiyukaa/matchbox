class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :skill

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :status, presence: true, inclusion: { in: ["accepted", "rejected", "pending"] }
end
