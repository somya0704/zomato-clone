class StaffDashobardController < ApplicationController
  def index
    @restaurant = Restaurant.where(:staff => @current_user.id).only(:name, :dishes).first
  end
end
