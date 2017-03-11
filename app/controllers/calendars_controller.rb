class CalendarsController < ApplicationController
  def show
  	respond_to do |format|
      @mechanic = Mechanic.find(params[:mechanic])
      @appointments = @mechanic.appointments.where(date: params[:date])
      format.js
    end
  end
end
