class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.text :name
      t.text :street_address
      t.integer :fein_number
      t.date :create_date

      t.timestamps
    end
  end
end
