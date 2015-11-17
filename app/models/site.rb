class Site < ActiveRecord::Base
	has_many :site_permits
	has_many :site_employees
  	validates_presence_of :name, :street_address, :fein_number
end