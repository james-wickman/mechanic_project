class Appointment < ApplicationRecord
	attr_accessible :date, :hour
 
	validates :date,  :presence => true
	validates :hour,  :presence => true,
                	  :uniqueness => {:scope => :date}

    has_one :job
    belongs_to :mechanic
end
