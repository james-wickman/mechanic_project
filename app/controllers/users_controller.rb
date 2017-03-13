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
        <button class="pullup_mechanic_button" data-mechanic="#{mechanic.id}">View Mechanics Availability</button>
      } 
    end
    @user_hash = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end 
  end
end


