class CreateEmployeeLicenses < ActiveRecord::Migration
  def change
    create_table :employee_licenses do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :license, index: true
      t.datetime :expiration_date
      t.boolean :obtained?

      t.timestamps
    end
  end
end
