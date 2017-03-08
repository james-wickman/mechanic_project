class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :vehicles
  has_many :jobs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates

	def full_street_address
		address + ' ' + city + ' ' + state + ' ' + zip
	end
end
