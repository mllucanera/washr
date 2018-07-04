class PagesController < ApplicationController

  def home
    case current_user.role
    when 'client'
      client_home
    when 'washer'
      washer_home
    end
  end

  private

  def client_home
    if current_user.cars.empty?
      mapper
    else
      booking = current_user.bookings.where.not(status: 'completed').first
      if booking
        redirect_to client_booking_path(booking)
      else
        mapper
      end
    end
  end

  def washer_home
    last_booking = current_user.bookings.last
    if current_user.bookings.empty? || last_booking.washed?
      redirect_to bookings_path
    else
      redirect_to booking_path(last_booking.id)
    end
  end

  def mapper
    if params[:address].present?
      address = params[:address]
      pin_address(address)
    else @markers = 0
    end
  end

  def welcome
  end

  def pin_address(address)
    res = Geocoder.search(address)
    @markers =
    [{
      lat: res.first.coordinates[0],
      lng: res.first.coordinates[1],
      icon: 'http://res.cloudinary.com/sebastianbuffosempe/image/upload/v1530630810/white_vbvbjz.png'
    }]
  end

  def completed?
    status = current_user.cars.bookings.last.status
    status == 3
  end

  def washed?
    status = current_user.bookings.last.status
    status == 2 || status == 3
  end

end
