class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.references :university, index: true, foreign_key: true
      t.string :name
      t.string :description
    end
  end
end
