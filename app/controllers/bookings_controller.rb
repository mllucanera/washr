class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
    @booking.address = params[:address]
    @cars = current_user.cars
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.status = 0
    if @booking.save
      redirect_to client_booking_path(@booking)
    else
      render new
    end
  end

  def show
  end

  def index
    if current_user.washer?
      @bookings = Booking.where(status: 0)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.washer = current_user
    @booking.status = 1
    @booking.save!
    redirect_to booking_path(@booking.id)
  end

  def completed
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save!
    redirect_to bookings_path
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:car_id, :address)
  end


end
