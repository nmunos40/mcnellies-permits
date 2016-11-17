class License < ActiveRecord::Base
	has_many :employee_licenses
	has_many :site_employees, :through => :employee_licenses
	
end
