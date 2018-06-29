class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings

  validates :user, presence: true
  validates :name, presence: true
  validates :plate, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :photo, presence: true

end
