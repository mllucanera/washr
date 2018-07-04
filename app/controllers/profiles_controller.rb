class ProfilesController < ApplicationController

  def show
    @user = current_user
    @role = @user.role
    @user_since = (((Time.now - @user.created_at) / 3600) / 24).round(2)
    @user_cars = @user.cars

    if @role == "client"
      @user_bookings = Booking.where(car: @user.cars)
    else
      @user_bookings = Booking.where(user: @user)
    end
    if @user_bookings.count == 0
      @last_booking = "N/A"
    else
      @last_booking = "#{((Time.now - @user_bookings.last.created_at) / 3600).round(2)} hours ago"
    end
  end
end
