class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, unique: true
      t.string :password_digest
      t.int :contacted_number
      # Add fields that let Rails automatically keep track
      # of when students are added or modified:
      t.timestamps
    end
  end
end
