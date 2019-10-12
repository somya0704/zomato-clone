class OwnerDashboardController < ApplicationController

  def index
    @restaurant = Restaurant.find_by(owner: @current_user.id)
    @staffs = User.find(@restaurant.staff).pluck(:name, :id)
  end

  def remove_staff
    @staffs = Restaurant.find_by(owner: @current_user.id).staff
    session[:@staffs] = nil
    redirect_to owner_dashboard_index_path, :notice => "Staff Removed!"
  end
end
