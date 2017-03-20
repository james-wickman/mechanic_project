class VehiclesController < ApplicationController
  def create
  	@vehicle = Vehicle.new(vehicle_params)
  	if @vehicle.save
  		redirect_to users_show_path
  	end
  end

  def show
  end

  def update
    @vehicle = Vehicle.find(vehicle_params[:id])
    @vehicle.update_attributes(vehicle_params)
    if @vehicle.save
      redirect_to users_show_path
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.destroy
      redirect_to users_show_path
    end
  end

  private

  def vehicle_params
      params.require(:vehicle).permit(:type, :make, :model, :user_id, :id)
    end
end
