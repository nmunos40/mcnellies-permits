class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.string :submitted_by
      t.string :status
      t.datetime :resolution_date
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
