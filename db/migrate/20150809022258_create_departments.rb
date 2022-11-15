class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.integer :university_id
      t.string :name
      t.string :description
    end
  end
end
