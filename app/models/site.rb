class Site < ActiveRecord::Base
	has_many :site_permits
	has_many :site_employees
  	validates_presence_of :name, :street_address, :fein_number

  scope :less_than_thirty, -> { where("expiration_date < CURRENT_TIMESTAMP  + '1 month'::interval") }
  scope :between_thirty_and_ninty, -> { where("expiration_date >= CURRENT_TIMESTAMP  + '1 month'::interval and expiration_date <= CURRENT_TIMESTAMP  + '3 month'::interval ") }
  scope :greater_than_ninty, -> { where("expiration_date > CURRENT_TIMESTAMP  + '3 month'::interval" ) }
  	


  	def get_emp_lic(timeline)
  		if timeline == 'small'
				self.site_employees.map{|se| se.employee_licenses.less_than_thirty}.flatten
			elsif timeline == 'medium'
				self.site_employees.map{|se| se.employee_licenses.between_thirty_and_ninty}.flatten
			elsif timeline =='large'
				self.site_employees.map{|se| se.employee_licenses.greater_than_ninty}.flatten
			else 
				self.site_employees.map{|se| se.employee_licenses}.flatten
		end
			
  	end

end