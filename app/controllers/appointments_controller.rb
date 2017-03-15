class AppointmentsController < ApplicationController
  def index
    date_from_ajax = params[:matched_date]
    reduce = Appointment.where(date: date_from_ajax)
    hour_on_date = reduce.collect {|x| x.hour}
    @new_dates = hour_on_date
    render :layout => false
  end
 
  def new
    @date = params[:date]
    respond_to do |format|
      
      @appointments = current_mechanic.appointments.where(date: appointment_params[:date].to_datetime..appointment_params[:date].to_datetime + 1.day).all
      byebug
      format.js
    end
  end
  def show
  end
  def create
    respond_to do |format|
      date_time = appointment_params[:date].to_datetime
      byebug
  	  if @appointment = Appointment.create(date: date_time, mechanic_id: current_mechanic.id)
        format.js
    	end
    end
  end

  def update
  end
  
  def destroy
    @appointment = Appointment.find(params[:id])
    respond_to do |format|
      if @appointment.destroy
        format.js
      end
    end
  end

  private

  def appointment_params
      params.require(:appointment).permit(:date, :mechanic_id)
    end
end
