class AddSubmittedToSitePermits < ActiveRecord::Migration
  def change
    add_column :site_permits, :submitted, :boolean
  end
end
