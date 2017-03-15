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
  		if job.appointment.date
	  		if job.appointment.date.between?(Date.today, Date.today+4)
	  			next_jobs << job 
	  		else
	  		end
	  	end
  	end
  	@days_array = []
	
  	for i in 0..4
  		@days_array << {date: Date.today + i, day: (Date.today + i).strftime("%A")}
  		collection_of_jobs[Date.today + i] = []
  		next_jobs.each do |job|
			if job.appointment.date.to_date == Date.today + i 
				collection_of_jobs[Date.today + i] << job
			end
		end
  	end
  end
  private

  def sort_jobs(job)
  end
end
