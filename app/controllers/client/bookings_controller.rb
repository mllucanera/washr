class Client::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def show
  end

  def index
    @bookings = Booking.all
    @current_user_bookings = []
    @bookings.each do |b|
      if b.client == current_user
        @current_user_bookings << b
      end
    end
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
