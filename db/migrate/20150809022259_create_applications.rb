class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.references :student, index: true, foreign_key: true
      t.references :university, index: true, foreign_key: true
      t.references :department, index: true, foreign_key: true
      t.string   :application_status
    end
  end
end
