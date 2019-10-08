class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
  end

  private

  def restaurant_params
    params.permit(:name, :image_url)
  end

end
