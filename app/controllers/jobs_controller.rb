class JobsController < ApplicationController
  def create
    
  	@vehicle = Vehicle.find(params[:vehicle])
  	@job = Job.create(vehicle_id: @vehicle.id, user_id: current_user.id)
  	if @job.save
  		redirect_to users_show_path
    else
      puts @job.errors.messages
  	end
  end

  def show
    @job = Job.find(params[:job_id])
    @mechanic = Mechanic.find(params[:mechanic_id])
  end

  def update
  	
    respond_to do |format|
      @job = Job.find(params[:job][:id])
      if params[:job][:customer_description]
        if @job.update_attributes(job_params)
          format.js {render 'job_description.js.erb'}
        end
      else
        @job.update_attributes(appointment_id: params[:appointment_id], mechanic_id: params[:mechanic_id])
        format.js 
      end
    end 
  end

  def destroy

  end
  private
  def job_params
    params.require(:job).permit(:mechanic_id, :cost, :start_time, :end_time, :customer_description, :available, :mechanic_notes, :id, :appointment_id)
  end

end
