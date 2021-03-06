class WasherProfile < ApplicationRecord
  belongs_to :user

  validates :dni_photo, presence: true
  validates :dni_id, presence: true
  validates :phone_number, presence: true

  mount_uploader :dni_photo, PhotoUploader

end
