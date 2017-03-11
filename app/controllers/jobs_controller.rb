class JobsController < ApplicationController
  def create
  	@vehicle = Vehicle.find(params[:vehicle_id])
  	@job = Job.new(vehicle_id: @vehicle.id, user_id: @vehicle.user_id)
  	if @job.save
  		redirect_to users_show_path
  	end
  end

  def show
    @job = Job.find(params[:job_id])
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def update
  	@job = Job.find(job_params[:id])
  	@job.update_attributes(job_params)
  	if @job.save
  		redirect_to users_show_path
  	end
  end

  def destroy

  end
  private
  def job_params
      params.require(:job).permit(:mechanic_id, :cost, :start_time, :end_time, :customer_description, :available, :mechanic_notes, :id)
    end

end
