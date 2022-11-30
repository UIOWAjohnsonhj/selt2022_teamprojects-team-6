class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :name
      t.string :attachment
      t.references :student, index: true, foreign_key: true
      t.timestamps
    end
  end
end
