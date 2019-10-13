class HomeController < ApplicationController
  def index
  @restaurants = Restaurant.search(params[:search])
  end
end
