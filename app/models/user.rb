class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  #washer profile
  has_one :washer_profile, dependent: :destroy

  has_many :cars, dependent: :destroy
  # washer bookings
  has_many :bookings, dependent: :destroy

  validates :role, presence: true, inclusion: { in: %w(washer client) }
  # validates :phone, presence: true, length: { minimum: 5 }
  # validates :photo, presence: true, if: :washer?

  mount_uploader :photo, PhotoUploader

  def washer?
    self.washer_profile
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:remote_photo_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.role = "client"
      user.skip_confirmation!
      user.save
    end

    return user
  end
end
