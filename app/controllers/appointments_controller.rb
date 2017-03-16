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
      date_time = params[:appointment][:date].to_datetime
      date = date_time.to_date 
      @appointments = current_mechanic.appointments.where(date: date..date + 1.day).all
      @appointments.each do |appointment|
      end
      @hours_in_day = []
      @available_array = []
      @taken_jobs = current_mechanic.jobs.where.not(appointment_id: nil)
      @available_times = @appointments
        # available 0 will be for not scheduled
        #  available 1 will be for scheduled but no job
        # available 2 will be for scheduled with job
      24.times do |n|
        @available_array << {available: 0, id: nil}
        @hours_in_day << (n < 10 ? "0#{n}:00:00" : "#{n}:00:00")
      end
      #sets days_available to the times that that mechanic has Appointment
      @appointments.each do |appointment| 
        time = appointment.date.localtime.strftime("%H:%M:%S")
        p "times: #{time}"
        if appointment.job
          @available_array[@hours_in_day.index(time)][:available] = 2 
          @available_array[@hours_in_day.index(time)][:id] = appointment[:id]
        else
          @available_array[@hours_in_day.index(time)][:available] = 1 
          @available_array[@hours_in_day.index(time)][:id] = appointment[:id] 
        end
      end
      format.js
    end
  end
  def show
  end
  def create
    respond_to do |format|
  	  if @appointment = Appointment.create(date: appointment_params[:date], mechanic_id: current_mechanic.id)
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
