class CreateSiteEmployees < ActiveRecord::Migration
  def change
    create_table :site_employees do |e|
      e.text :first_name
      e.text :last_name
      e.text :employee_ID
      e.text :phone_number
      e.text :email_address
      e.boolean :salaried?
      e.date :date_hired
      e.date :date_fired
      e.boolean :employed?
      e.integer :site_id
      e.timestamps
    end
  end
end
