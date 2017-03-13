class MechanicsController < ApplicationController
  def index
  	@jobs = current_mechanic.jobs
	
  end

  def show
  end

end
