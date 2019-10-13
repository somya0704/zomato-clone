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

  def show
    @restaurant = Restaurant.where(id: params[:id]).only(:name, :dishes).first
  end

  def add_dish
    dish = Dish.new(dish_params)
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    restaurant.dishes << dish
    restaurant.save
  end

  private

  def restaurant_params
    params.permit(:name, :image_url)
  end

  def dish_params
    params.permit(:name, :price)
  end

end
