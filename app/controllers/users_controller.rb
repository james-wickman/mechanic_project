class UsersController < ApplicationController
  def index
  end

  def show
  	@new_vehicle = Vehicle.new
  	@new_job = Job.where(user_id: current_user.id).where(customer_description: nil).last
  	@user = current_user
    @mechanics = Mechanic.where.not(latitude: nil).where.not(longitude: nil)
    @mechanics = Mechanic.where.not(latitude: nil).where.not(longitude: nil)
    @mechanics_hash = Gmaps4rails.build_markers(@mechanics) do |mechanic, marker|
      marker.lat mechanic.latitude
      marker.lng mechanic.longitude
      marker.picture({
        url: "/assets/red_flag.gif",
        width: 32,
        height: 32
       })
      marker.infowindow %Q{
        <h2>
          #{mechanic.first_name} 
          #{mechanic.last_name}
        </h1> 
        <h3>
          #{mechanic.email}
        </h3>
        
        <button class="pullup_mechanic_button" data-mechanic="#{mechanic.id}">View Mechanic's Availability</button>
      } 
    end
    @user_hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end 
  end

  def contact_mechanics 
    respond_to do |format|
      mechanic = Mechanic.find(params[:mechanic])
      job = Job.find(params[:job])
      vehicle = job.vehicle.make + " " + job.vehicle.model
      subject = params[:subject]
      message = params[:message]
      Pony.mail(:to => "#{mechanic.email}", :from => "#{current_user.email}", :subject => "#{vehicle}: #{subject}", :body => "#{message}")
      format.js
    end
  end
  def cancel_user_appointment
    job_id = params[:id]
    @job = Job.find(job_id)
    if @job.update_attributes(appointment_id: nil, mechanic_id: nil)
      redirect_to users_show_path
    end
  end
end


