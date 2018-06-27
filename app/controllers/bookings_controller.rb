class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy]

  def new
    @booking = Booking.new
    if Car.all.empty?

    else

    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.address = address
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

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require[:booking].permit[:car, :address]
  end


end
