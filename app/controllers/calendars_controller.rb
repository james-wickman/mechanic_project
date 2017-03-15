class CalendarsController < ApplicationController
  def show
  	respond_to do |format|
  		@taken_jobs = Job.where.not(appointment_id: nil)
		@mechanic = Mechanic.find(params[:mechanic])
		@appointments = @mechanic.appointments.where(date: params[:date])
		#sets all the hours in the day 
		#nothing is available on the schedule day by default
		@hours_in_day = []
		@available_array = []
		24.times do |n|
			@available_array << {available: 0, id: nil}
			@hours_in_day << (n < 10 ? "0#{n}00" : "#{n}00") #turnery
		end
		@available_times = @appointments - @taken_jobs
		
		#sets days_available to the times that that mechanic has Appointment
		@available_times.each do |time| 
		  @available_array[@hours_in_day.index(time[:hour])][:available] = 1 
		  @available_array[@hours_in_day.index(time[:hour])][:id] = time[:id] 
		end
		
		format.js
    end
  end
end
