class OwnersController < ApplicationController

  def new
    @user = User.new
  end
end
