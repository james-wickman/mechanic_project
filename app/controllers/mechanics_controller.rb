class MechanicsController < ApplicationController
  def index
  	@jobs = current_mechanic.jobs
	@doc = Nokogiri::HTML::DocumentFragment.parse <<-EOHTML
  end

  def show
  end
end
