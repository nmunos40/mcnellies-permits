class EmployeeLicense < ActiveRecord::Base
  belongs_to :employee
  belongs_to :license
end
