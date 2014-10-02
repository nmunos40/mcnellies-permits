class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.text :name
      t.text :description
      t.date :expiration_date
      t.text :manager
      t.integer :site_id

      t.timestamps
    end
  end
end
