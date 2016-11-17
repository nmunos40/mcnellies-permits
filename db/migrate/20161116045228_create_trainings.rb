class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :course_name

      t.timestamps
    end
  end
end
