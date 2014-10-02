class ChangeFein < ActiveRecord::Migration
	def up
    change_column :sites, :fein_number, :text
  end

  def down
    change_column :sites, :fein_number, :integer
  end
end
