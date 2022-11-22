class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :student, index: true, foreign_key: true
      t.string :company_name
      t.string :description
      t.string :job_title
      t.string :from
      t.string :to
    end
  end
end
