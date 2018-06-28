class PagesController < ApplicationController

  def home
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
      lng: res.first.coordinates[1]
      }]
  end
end
