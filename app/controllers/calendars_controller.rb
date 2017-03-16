class CalendarsController < ApplicationController
  def show
  	respond_to do |format|
  		date = params[:date].to_date
  		@taken_jobs = Job.where.not(appointment_id: nil)
		@mechanic = Mechanic.find(params[:mechanic])
		@appointments = @mechanic.appointments.where(date: date..date + 1.day).all
		#sets all the hours in the day 
		#nothing is available on the schedule day by default
		@hours_in_day = []
		@available_array = []
		24.times do |n|
			@available_array << {available: 0, id: nil}
			@hours_in_day << (n < 10 ? "0#{n}:00:00" : "#{n}:00:00") #turnery
			p @hours_in_day
		end
		@available_times = @appointments
		@available_times.each do |ava|
			p ava
		end
		#sets days_available to the times that that mechanic has Appointment
		@available_times.each do |appointment| 
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
end
