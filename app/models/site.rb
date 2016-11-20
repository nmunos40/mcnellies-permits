class Site < ActiveRecord::Base
	has_many :site_permits
	has_many :site_employees
  	validates_presence_of :name, :street_address, :fein_number


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

  	def get_emp_train(timeline)
  		if timeline == 'small'
				self.site_employees.map{|se| se.employee_trainings.less_than_thirty}.flatten
			elsif timeline == 'medium'
				self.site_employees.map{|se| se.employee_trainings.between_thirty_and_ninty}.flatten
			elsif timeline =='large'
				self.site_employees.map{|se| se.employee_trainings.greater_than_ninty}.flatten
			else 
				self.site_employees.map{|se| se.employee_trainings}.flatten
		end
			
  	end

end