class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :student_id, unique: true
      t.string   :student_id
      t.string   :university_id
      t.string   :department_id
      t.string   :application_status
    end
  end
end
