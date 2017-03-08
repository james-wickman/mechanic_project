class JobsController < ApplicationController
  def create
  	@vehicle = Vehicle.find(params[:vehicle_id])
  	@job = Job.new(vehicle_id: @vehicle.id, user_id: @vehicle.user_id)
  	if @job.save
  		redirect_to users_show_path
  	end
  end

  def show
  end

  def update
  end

  def destroy

  end
  private

end
