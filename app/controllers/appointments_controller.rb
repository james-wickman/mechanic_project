class AppointmentsController < ApplicationController
  def index
    date_from_ajax = params[:matched_date]
    reduce = Appointment.where(:date => date_from_ajax)
    hour_on_date = reduce.collect {|x| x.hour}
    @new_dates = hour_on_date
    render :layout => false
  end
 
  def new
    @appointments = Appointment.create
      respond_to do |format|
        format.html
        format.js
     end
  end
  
 
  def create
    respond_to do |format|
      format.js 
      byebug
  	  @appointment = Appointment.create(date: params[:date], hour: params[:hour], mechanic_id: current_mechanic.id)
    	if @appointment.save
        format.js
    	end
    end
  end

  def update
  end

  private

  def appointment_params
      params.require(:appointment).permit(:date, :hour, :mechanic_id)
    end
end
