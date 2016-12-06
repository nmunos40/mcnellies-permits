class RemoveMangerFromSitePermitsTable < ActiveRecord::Migration
  def change
  	remove_column :site_permits, :manager
  end
end
