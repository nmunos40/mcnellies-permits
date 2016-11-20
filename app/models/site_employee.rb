class SiteEmployee < ActiveRecord::Base
	belongs_to :site
	has_many :employee_licenses
	has_many :licenses, :through => :employee_licenses

  scope :less_than_thirty, -> { where("expiration_date < CURRENT_TIMESTAMP  + '1 month'::interval") }
  scope :between_thirty_and_ninty, -> { where("expiration_date >= CURRENT_TIMESTAMP  + '1 month'::interval and expiration_date <= CURRENT_TIMESTAMP  + '3 month'::interval ") }
  scope :greater_than_ninty, -> { where("expiration_date > CURRENT_TIMESTAMP  + '3 month'::interval" ) }

  def self.manager
  	where(manager: true)
  end

  def self.manager!
  	where(manager: false)
  end

  def to_s
    "#{first_name} #{last_name}"
  end

end
