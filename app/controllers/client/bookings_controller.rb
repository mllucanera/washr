class Client::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def show
  end

  def update
    @booking.washer = current_user
    @booking.status = 3
    @booking.save!
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
