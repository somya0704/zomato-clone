class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    if is_owner
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.owner = @current_user.id
      @restaurant.save
      redirect_to  owner_dashboard_index_path
    end
  end

  private

  def restaurant_params
    params.permit(:name, :image_url)
  end

end
