class SiteEmployee < ActiveRecord::Base
	belongs_to :site
	has_many :employee_licenses
	has_many :licenses, :through => :employee_licenses
  has_many :employee_trainings
  has_many :trainings, :through => :employee_trainings

  validates_presence_of :site_id, :first_name, :last_name

  def self.manager
  	where(manager: true)
  end

  def self.manager!
  	where(manager: false)
  end

  def to_s
    "#{first_name} #{last_name}"
  end

  def self.emp_lic_small
    self.all.map{|se| se.employee_licenses.less_than_thirty}.flatten
  end

  def self.emp_lic_medium
    self.all.map{|se| se.employee_licenses.between_thirty_and_ninty}.flatten
  end

  def self.emp_lic_large
    self.all.map{|se| se.employee_licenses.greater_than_ninty}.flatten
  end

  def self.emp_train_small
    self.all.map{|se| se.employee_trainings.less_than_thirty}.flatten
  end

  def self.emp_train_medium
    self.all.map{|se| se.employee_trainings.between_thirty_and_ninty}.flatten
  end

  def self.emp_train_large
    self.all.map{|se| se.employee_trainings.greater_than_ninty}.flatten
  end

  

end
