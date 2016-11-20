class CreateEmployeeTrainings < ActiveRecord::Migration
  def change
    create_table :employee_trainings do |t|
      t.belongs_to :site_employee, index: true
      t.belongs_to :training, index: true
      t.datetime :expiration_date
      t.boolean :obtained?

      t.timestamps
    end
  end
end
