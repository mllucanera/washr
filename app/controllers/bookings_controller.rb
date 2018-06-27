class BookingsController < ApplicationController
  def new
    @booking_form = BookingForm.new
    binding.pry
  end
end
