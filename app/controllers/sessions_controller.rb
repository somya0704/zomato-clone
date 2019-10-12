class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if user.email_confirmed
        if user.role == 'owner'
          session[:user_id] = user.id
          redirect_to '/restaurants/new', :notice => "Logged in!"
        elsif user.role == 'customer'
          session[:user_id] = user.id
          redirect_to '/home/index', :notice => "Logged in!"  
        else
          session[:user_id] = user.id
          redirect_to staff_dashobard_index_path, :notice => "Logged in!"
        end  
      else
        redirect_to login_path, :notice => "Please check your email to confirm account"
      end
    else
      redirect_to login_path, :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
