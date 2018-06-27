class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render new
    end
  end

  def show
  end

  def index
    @bookings = Booking.where(status: 0)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.washer = current_user
    @booking.status = 1
    @booking.save!
    redirect_to booking_path(@booking.id)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require[:booking].permit[:car, :address]
  end
end
