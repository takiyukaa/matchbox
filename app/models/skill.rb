class Skill < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: :name,
    associated_against: {
      user: [ :first_name, :second_name, :city]
    },
    using: {
      tsearch: { prefix: true }
    }
end
