class UsersController < ApplicationController
   
  def new
    @user = User.new
  end

  def create
    user = User.where(email: params[:email].downcase).exists?
    if user
      flash[:error] = "User already exist"
    else
    @user = User.new(user_params)
    @user.role = "owner"
      if @user.save
        UserMailer.registration_confirmation(@user).deliver
        flash[:success] = "Please confirm your email address to continue"
        redirect_to '/login'
      else
        redirect_to '/'
      end
    end
  end

  def destroy
  end
  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
