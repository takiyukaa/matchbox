class User < ApplicationRecord
  has_many :skills, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :work_histories, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\S+@\S+.\S{2,3}/ }
  validates :password, presence: true, length: { minimum: 8 }
  validates :city, presence: true
  validates :bio, presence: true
end
