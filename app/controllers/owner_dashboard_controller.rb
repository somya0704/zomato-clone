class OwnerDashboardController < ApplicationController
  def index
    @restaurant = Restaurant.find_by(owner: @current_user.id)
  end
end
