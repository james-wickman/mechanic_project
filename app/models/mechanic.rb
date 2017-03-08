class Mechanic < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :jobs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode         # auto-fetch coordinates

	def full_street_address
    [home_shop_address, city, state, zip].compact.join(', ')
  end

end
