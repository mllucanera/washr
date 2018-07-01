class WasherProfilesController < ApplicationController

  def welcome
  end

  def new
    @washer_profile = WasherProfile.new
  end

  def create
    @washer_profile = WasherProfile.new(washer_profile_params)
    @washer_profile.user = current_user
    if @washer_profile.save
      user = User.find(current_user.id)
      user.role = "washer"
      user.save!
      redirect_to bookings_path
    else
      render 'new'
    end
  end

private

  def washer_profile_params
    params.require(:washer_profile).permit(:dni_photo,:dni_photo_cache, :dni_id, :phone_number)
  end

end
