class Issue < ActiveRecord::Base
	 validates_presence_of :name, :description, :status
	 
	 scope :closed, -> { where("status in ('Resolved', 'No Longer Needed')" ) }
	 scope :open, -> { where("status NOT in ('Resolved', 'No Longer Needed')" ) }

end
