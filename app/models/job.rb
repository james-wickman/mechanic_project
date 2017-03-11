class Job < ApplicationRecord
  belongs_to :vehicle
  belongs_to :user
  belongs_to :appointment, optional: true
end
