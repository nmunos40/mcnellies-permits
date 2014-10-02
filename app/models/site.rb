class Site < ActiveRecord::Base
	has_many :site_permits
  	validates_presence_of :name, :street_address, :fein_number
end