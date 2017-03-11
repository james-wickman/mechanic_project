class Appointment < ApplicationRecord

	validates :date,  :presence => true
	validates :hour,  :presence => true


    has_one :job
    belongs_to :mechanic
end
