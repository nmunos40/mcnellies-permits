class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :name
      t.string :domain
      t.string :logo

      t.timestamps
    end
  end
end
