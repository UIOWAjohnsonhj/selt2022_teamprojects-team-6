class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :student_id
      t.string :company_name
      t.string :description
      t.string :job_title
      t.string :from
      t.string :to
    end
  end
end
