class EmployeeLicense < ActiveRecord::Base
  belongs_to :site_employee
  belongs_to :license

	scope :less_than_thirty, -> { where("expiration_date < CURRENT_TIMESTAMP  + '1 month'::interval") }
	scope :between_thirty_and_ninty, -> { where("expiration_date >= CURRENT_TIMESTAMP  + '1 month'::interval and expiration_date <= CURRENT_TIMESTAMP  + '3 month'::interval ") }
	scope :greater_than_ninty, -> { where("expiration_date > CURRENT_TIMESTAMP  + '3 month'::interval" ) }
  
end
