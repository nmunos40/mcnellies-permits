class IndexExpDate < ActiveRecord::Migration
  def change
  	  	add_index :site_permits, :expiration_date
  end
end
