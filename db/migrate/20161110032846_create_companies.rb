class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :ID
      t.string :Name
      t.string :Phone
      t.string :Email
      t.string :Sloagn

      t.timestamps
    end
  end
end
