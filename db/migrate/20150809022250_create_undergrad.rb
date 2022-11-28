class CreateUndergrad < ActiveRecord::Migration
  def change
    create_table :undergrad do |t|
      t.string :student_id, unique: true
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
