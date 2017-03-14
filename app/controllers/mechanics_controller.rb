class MechanicsController < ApplicationController
  def index
  	@jobs = current_mechanic.jobs
	
  end

  def show
  	@jobs = current_mechanic.jobs
  end

end
