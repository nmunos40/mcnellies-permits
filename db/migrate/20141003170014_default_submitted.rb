class DefaultSubmitted < ActiveRecord::Migration
  def change
  	change_column :site_permits, :submitted, :boolean, default: false
  end
end
