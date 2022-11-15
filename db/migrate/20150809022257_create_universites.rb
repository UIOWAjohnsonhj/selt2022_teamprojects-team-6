class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :state
      t.string :rank
    end
  end
end
