class Appointment < ApplicationRecord

	validates :date,  :presence => true


    has_one :job
    belongs_to :mechanic
end
