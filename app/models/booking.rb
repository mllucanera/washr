class Booking < ApplicationRecord
  belongs_to :washer, foreign_key: "user_id", class_name: "User"
  belongs_to :client, through: :car, source: :user
  belongs_to :car
end
