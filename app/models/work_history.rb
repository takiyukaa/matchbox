class WorkHistory < ApplicationRecord
  belongs_to :user
  validates :job_title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validates :description, presence: true
end
