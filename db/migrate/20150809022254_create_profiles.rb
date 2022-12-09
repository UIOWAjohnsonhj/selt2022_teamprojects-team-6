class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :student, index: true, foreign_key: true
      t.integer :gre
      t.integer :toefl
      t.integer :capa
      t.string :interested_major
      t.string :term
      t.string :year
      t.string :college_name
      t.float :gpa
    end
  end
end
