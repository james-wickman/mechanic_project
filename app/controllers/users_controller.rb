class UsersController < ApplicationController
  def index
  	@user = current_user
  	@hash = Gmaps4rails.build_markers(@user) do |user, marker|
	  marker.lat user.latitude
	  marker.lng user.longitude
	end
  end

  def show
  	@new_vehicle = Vehicle.new
  	@new_job = current_user.jobs.where(customer_description: nil).last
  	@user = current_user
  end
end
