class CreateUndergraduateSchools < ActiveRecord::Migration
  def change
    create_table :undergraduate_schools do |t|
      t.references :student, index: true, foreign_key: true
      t.string :country
      t.string :university_name
      t.string :major
      t.float :gpa
      t.string :grading_scale
      t.integer :start_year
      t.integer :expected_grad_year
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
