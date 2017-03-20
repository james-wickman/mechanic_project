class MechanicsController < ApplicationController
  def index
  	@jobs = current_mechanic.jobs
  	time = Time.new
  	@current_time = time.hour.to_s + time.min.to_s
  	collection_of_jobs = {}
  	hours_array = 0..23
  end
  def show
  	time = Time.new
  	@current_time = time.hour.to_s + time.min.to_s
  	@jobs = current_mechanic.jobs
  	collection_of_jobs = {}
  	next_jobs = []
  	@jobs.each do |job| 
      if job.appointment 
    		if job.appointment.date
  	  		if job.appointment.date.between?(Date.today, Date.today+4)
  	  			next_jobs << job 
  	  		else
  	  		end
  	  	end
      end
  	end
  	@days_array = []
  	for i in 0..4
  		@days_array << {date: Date.today + i, day: (DateTime.now - 2.hours + i).strftime("%A")}
  		collection_of_jobs[Date.today + i] = []
  		next_jobs.each do |job|
			if job.appointment.date.to_date == Date.today + i 
				collection_of_jobs[Date.today + i] << job
			end
		end
  	end
  end
  def contact_customers 
    subject = params[:subject]
    message = params[:message]
    appointment = params[:appointment]
    vehicle = params[:user_vehicle]
    user_email = params[:user_email]
    p "this is subject#{subject}"
    p "this is message #{message}"
    Pony.mail(:to => "#{user_email}", :from => "#{current_mechanic.email}", :subject => "#{vehicle} Scheduled For #{appointment}: #{subject}", :body => "#{message}")
  end
  def cancel_appointment
    appointment = Appointment.find(params[:appointment])
    vehicle = appointment.job.vehicle.make + " " + appointment.job.vehicle.model
    job = appointment.job
    user = job.user
    message = params[:message]
    if appointment.destroy
      if job.update_attributes(mechanic_id: nil, appointment_id: nil)
        Pony.mail(:to => "#{user.email}", :from => "#{current_mechanic.email}", :subject => "#{vehicle} Scheduled For #{appointment}: has been canceled", :body => "#{message}")
      end
    end
  end
  private

  def sort_jobs(job)
  end
end
