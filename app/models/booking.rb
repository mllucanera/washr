class Booking < ApplicationRecord
  belongs_to :washer, foreign_key: "user_id", class_name: "User"
  belongs_to :car
  has_one :client, through: :car, source: :user

  validates :car, presence: true
  validates :washer, presence: true

end
