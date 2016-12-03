class SitePermit < ActiveRecord::Base
	belongs_to :site

	scope :less_than_thirty, -> { where("expiration_date < CURRENT_TIMESTAMP  + '1 month'::interval") }
	scope :between_thirty_and_ninty, -> { where("expiration_date >= CURRENT_TIMESTAMP  + '1 month'::interval and expiration_date <= CURRENT_TIMESTAMP  + '3 month'::interval ") }
	scope :greater_than_ninty, -> { where("expiration_date > CURRENT_TIMESTAMP  + '3 month'::interval" ) }
  scope :unsubmitted, -> { where("submitted = 'f' " ) }

  validates_presence_of :name, :expiration_date, :site_id


  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |permit|
        csv << permit.attributes.values_at(*column_names)
      end
    end
  end

  def self.search(search)
    if search
      where('lower(name) LIKE ?', "%#{search.downcase}%")
    else
      all
    end
  end



end