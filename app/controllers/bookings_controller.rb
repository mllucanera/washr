class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy, :update, :mark_as_washing, :mark_as_washed]

  def new
    @booking = Booking.new
    @address = params[:address]
    @cars = current_user.cars
    @car = Car.new
  end

  def confirm
    @booking = Booking.new(booking_confirm_params)
    @booking.status = 0
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
    @location = request.location
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

  def washer_map
    bookings = Booking.where(status: "washer_pending").where.not(latitude: nil, longitude: nil)
    @markers = bookings.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude,
        icon: 'https://res.cloudinary.com/jotisempe/image/upload/v1530712696/map-icon.png',
        infoWindow: { content: render_to_string(partial: "/shared/car_book", locals: { booking: booking }) }
      }
    end
    @markers = nil if @markers.empty?
  end

  def mark_as_washing
    @booking.washer = current_user
    @booking.status = 1
    if @booking.save
      respond_to do |format|
        format.html { redirect_to booking_path(@booking.id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end
    end
  end

  def mark_as_washed
    @booking.washer = current_user
    @booking.status = 2
    if @booking.save
      respond_to do |format|
        format.html { redirect_to booking_path(@booking.id) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'bookings/show' }
        format.js  # <-- idem
      end
    end
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

  def booking_confirm_params
    params.permit(:car_id, :address)
  end

  def booking_params
    params.require(:booking).permit(:car_id, :address)
  end

  def washed?
    status = current_user.bookings.last.status
    status == 'washed' || status == 'completed'
  end
end
