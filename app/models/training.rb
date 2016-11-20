class Training < ActiveRecord::Base
	has_many :employee_trainings
	has_many :site_employees, :through => :employee_trainings
end
