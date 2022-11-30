class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.references :department, index: true, foreign_key: true
      t.string   :first_name
      t.string   :last_name
      t.string   :email  ,unique: true
      t.string   :password_digest
      t.boolean  :chair
      t.string   :university
      t.string   :focus_area
      t.string   :research_url
    end
  end
end
