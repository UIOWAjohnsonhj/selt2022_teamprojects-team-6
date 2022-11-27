class ChangeFacultiesToFacultyMembers < ActiveRecord::Migration[5.0]
  def change
    rename_table :faculties, :faculty_members
  end
end
