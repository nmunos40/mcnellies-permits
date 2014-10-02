class DeleteOldTable < ActiveRecord::Migration
  def change
  	drop_table :permits
  end
end
