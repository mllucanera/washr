class ProfilesController < ApplicationController

  def show
    @user = current_user
    @role = @user.role
    # @user_since = (((Time.now - @user.created_at) / 3600) / 24).round(2)
    @user_cars = @user.cars

    @nro_bookings = []
    current_user.cars.map { |car| (@nro_bookings << car.bookings.where.not(status: 'completed').last) unless car.bookings.empty? }


    # if @role == "client"
    #   @user_bookings = Booking.where(car: @user.cars).count
    # else
    #   @user_bookings = Booking.where(user: @user).count
    # end
    # if @user_bookings == 0
    #   @last_booking = "N/A"
    # else
    #   @last_booking = "#{(Time.now - @user_bookings.last.create_at) / 3600} hours ago"
    # end

  end
end
