class AddIndex < ActiveRecord::Migration
  def change
  	add_index :site_permits, :site_id
  end
end
