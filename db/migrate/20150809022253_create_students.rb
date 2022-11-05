class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name, unique: true
      t.string :last_name
      t.string :user_name
      t.string :email, unique: true
      t.rename :password,:password_digest
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
