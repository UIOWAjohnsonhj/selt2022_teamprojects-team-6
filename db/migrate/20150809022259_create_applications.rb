class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer   :student_id
      t.integer   :university_id
      t.integer   :department_id
      t.string   :application_status
    end
  end
end
