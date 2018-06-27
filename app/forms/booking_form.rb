class BookingForm
  include ActiveModel::Model

  attr_accessor :step,
    :address, :longitude, :latitude

  validates :address, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true

  def initialize
    @step = 1
  end

  def persisted?
    false
  end
end
