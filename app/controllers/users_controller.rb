class UsersController < ApplicationController
  def index
  end

  def show
  	@new_vehicle = Vehicle.new
  	@new_job = current_user.jobs.where(customer_description: nil).last
  end
end
