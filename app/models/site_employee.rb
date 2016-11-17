class SiteEmployee < ActiveRecord::Base
	belongs_to :site
	has_many :employee_licenses
	has_many :licenses, :through => :employee_licenses

  def to_s
    "#{first_name} #{last_name}"
  end


end
