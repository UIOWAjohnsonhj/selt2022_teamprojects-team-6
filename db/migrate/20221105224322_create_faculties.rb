class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :user_name  ,unique: true
      t.string   :email  ,unique: true
      t.string   :password_digest
      t.string   :department
      t.boolean  :chair
      t.string   :university
    end
  end
end
