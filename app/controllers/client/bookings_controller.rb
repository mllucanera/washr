class Client::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def show
  end

  def index
    @bookings = Booking.all
    @current_user_bookings = Booking.where(client: current_user)
  end

  def update
    @booking.status = 3
    @booking.save!
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
