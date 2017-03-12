class CalendarsController < ApplicationController
  def show
  	respond_to do |format|
  		@taken_jobs = Job.where.not(appointment_id: nil)
		@mechanic = Mechanic.find(params[:mechanic])
		@appointments = @mechanic.appointments.where(date: params[:date])
		format.js
    end
  end
end
