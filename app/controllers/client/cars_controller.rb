class Client::CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'client/car/new' }
        format.js
      end
    end
  end

  def show
  end

  def index
    @cars = current_user.cars
    @car = Car.new
  end

  def update
    @car = Car.update(car_params)
    redirect_to client_cars_path
  end

  def destroy
    @car.destroy
    redirect_to client_cars_path
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:plate, :color, :name, :model, :brand, :photo)
  end

end

