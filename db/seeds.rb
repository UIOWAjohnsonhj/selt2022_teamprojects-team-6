# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = [{:first_name => 'Kiana', :last_name => 'Erickson', :username => 'kberickson'},
          {:first_name => 'Joslin', :last_name => 'Some', :username => 'jsome'},
          {:first_name => 'Evan', :last_name => 'Brewer', :username => 'ebrewer'},
          {:first_name => 'Ben', :last_name => 'Desollar', :username => 'bdesollar'},
          {:first_name => 'Adnane', :last_name => 'Ezouhri', :username => 'aezouhri'},
          {:first_name => 'Christian', :last_name => 'Baseme', :username => 'cbaseme'},
  	 ]

students.each do |student|
  Student.create!(student)
end
