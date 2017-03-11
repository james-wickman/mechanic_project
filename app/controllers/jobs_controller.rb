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
  	@job = Job.find(params[:id])
    respond_to do |format|
      @job.update_attributes(appointment_id: params[:appointment_id], mechanic_id: params[:mechanic_id])
      format.js 
    end 
  end

  def destroy

  end
  private
  def job_params
      params.require(:job).permit(:mechanic_id, :cost, :start_time, :end_time, :customer_description, :available, :mechanic_notes, :id, :appointment_id)
    end

end
