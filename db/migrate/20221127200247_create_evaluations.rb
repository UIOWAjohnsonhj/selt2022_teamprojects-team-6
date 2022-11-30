class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references 'faculty'
      t.references 'student'
      t.string 'comment'
      t.string 'applied_term'
      t.integer 'score'
      t.string 'status'
      t.timestamps # use timestamps to get the 'date of eval' column in my_evaluations and faculty_evaluations pages
    end
  end
end
