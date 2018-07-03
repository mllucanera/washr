class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :destroy, :update]

  def new
    @booking = Booking.new
    @booking.address = params[:address]
    @cars = current_user.cars
    @car = Car.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.status = 0
    if @booking.save
      redirect_to client_booking_path(@booking)
    else
      @cars = current_user.cars
      @car = Car.new
      render 'new'
    end
  end

  def show
  end

  def index
    @booking = current_user.bookings.last
    case current_user.role
    when "client"
      redirect_to root_path
    when "washer"
      if current_user.bookings.empty? || washed?
        @bookings = Booking.where(status: 0)
      else
        redirect_to booking_path(@booking.id)
      end
    end
  end

  def edit
  end

  def update
    @booking.washer = current_user
    @booking.status = 1
    @booking.save!
    redirect_to booking_path(@booking.id)
  end

  def completed
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save!
    redirect_to booking_path(@booking.id)
  end

  def washer_history
    @bookings = current_user.bookings
    @completed = Booking.where(status: 'completed').where(user_id: current_user.id)
  end
  
  private
  
  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:car_id, :address)
  end

  def washed?
    status = current_user.bookings.last.status
    status == 'washed' || status == 'completed'
  end
end
