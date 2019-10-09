class OwnerDashboardController < ApplicationController
  def index
    @restaurant = Restaurant.find_by(owner: @current_user.id)
    @staffs = User.find(@restaurant.staff).pluck(:name)
  end
end
