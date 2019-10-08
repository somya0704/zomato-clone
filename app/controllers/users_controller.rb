class UsersController < ApplicationController
   
  def new
    @user = User.new
  end

  def create
    user = User.where(email: params[:email].downcase).exists?
    if user
      flash[:error] = "User already exist"
      redirect_to signup_path
    else
      @user = User.new(user_params)
      @user.role = "owner"
      if @user.save
        UserMailerConfirmationJob.perform_later(
          @user.email.to_s, 
          @user.confirmation_token.to_s,
          )
        flash[:success] = "Please confirm your email address to continue"
        redirect_to '/login'
      else
        redirect_to '/'
      end
    end
  end

  def confirm_email
    token = params[:token]
    user = User.find_by(confirmation_token: token)
    if user
      user.update_attribute(:email_confirmed, true)
      redirect_to '/login'
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
