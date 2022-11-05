class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :student_id
      t.integer :gre
      t.integer :toefl
      t.string :interested_major
      t.string :term
      t.string :year

    end
  end
end