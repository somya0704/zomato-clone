class StaffsController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.role = "staff"
    @user.password = "Random"
    @user.save
    restaurant = Restaurant.find_by(owner: @current_user.id)
    restaurant.add_staff(@user.id)
  end


  def user_params
    params.permit(:name, :email)
  end

end
