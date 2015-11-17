class CreateSiteEmployees < ActiveRecord::Migration
  def change
    create_table :site_employees do |e|
      e.text :first_name
      e.text :last_name
      e.text :contract_number
      e.decimal :premium, :precision => 30, :scale => 10
      e.boolean :salaried?
      e.text :insurance_type 
      e.text :coverage_type
      e.boolean :tipped?
      e.boolean :ADP_Deduction
      e.decimal :deduction_amount, :precision => 30, :scale => 10
      e.text :collection_type
      e.date :create_date
      e.boolean :employed?
      e.integer :site_id
      e.timestamps
    end
  end
end
