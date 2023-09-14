class RestaurantsController < ApplicationController
  before_action :restaurant, only: %i[show update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    # check private method and before_action
    @restaurant
  end

  def new
    # instantiate, info is nil
    @restaurant = Restaurant.new
    # use raise here to check
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # check private method and before_action
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end

  def restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
