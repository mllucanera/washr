class Client::CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    # if @car.save
    #   redirect_to client_cars_path
    # else
    #   render 'new'
    # end
    if @car.save
      respond_to do |format|
        # format.html { redirect_to client_cars_path) }
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
  end

  def edit
  end

  def update
    @car = Car.update(car_params)
  end

  def destroy
    @car.destroy
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:plate, :color, :name, :model, :brand, :photo)
  end

end

