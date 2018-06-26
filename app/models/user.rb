class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cars, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :role, presence: true, inclusion: { in: %w(washer client) }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, length: { minimum: 5 }
  validates :photo, presence: true, if: :washer?

  def washer?
    role == "washer"
  end

end
