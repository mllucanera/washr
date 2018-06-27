class Booking < ApplicationRecord
  belongs_to :washer, foreign_key: "user_id", class_name: "User"
  belongs_to :car
  has_one :client, through: :car, source: :user

  validates :car, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
