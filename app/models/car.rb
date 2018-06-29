class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true
  validates :plate, presence: true, uniqueness: true
  validates :brand, presence: true
  validates :color, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

end
