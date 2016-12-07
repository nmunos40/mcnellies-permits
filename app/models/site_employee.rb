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

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      siteemployees = find_by_id(row["id"]) || new
      siteemployees.attributes = row.to_hash.slice(*row.to_hash.keys)
      siteemployees.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, csv_options: {encoding: "iso-8859-1:utf-8"})
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end



end
