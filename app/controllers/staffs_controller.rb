class StaffsController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.role = "staff"
    @user.password = "Random"
    @user.save
    StaffConfirmationEmailJob.perform_later(
          @user.email.to_s, 
          @user.confirmation_token.to_s,
          @user.password
        )
    restaurant = Restaurant.find_by(owner: @current_user.id)
    restaurant.add_staff(@user.id)
    redirect_to owner_dashboard_index_path
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
