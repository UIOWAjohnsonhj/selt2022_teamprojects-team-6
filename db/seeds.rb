# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = [{:first_name => 'Kiana', :last_name => 'Erickson', :user_name => 'kberickson', :password=>"1234"},
          {:first_name => 'Joslin', :last_name => 'Some', :user_name => 'jsome', :password=>"1234"},
          {:first_name => 'Evan', :last_name => 'Brewer', :user_name => 'ebrewer', :password=>"1234"},
          {:first_name => 'Ben', :last_name => 'Desollar', :user_name => 'bdesollar', :password=>"1234"},
          {:first_name => 'Adnane', :last_name => 'Ezouhri', :user_name => 'aezouhri', :password=>"1234"},
          {:first_name => 'Christian', :last_name => 'Baseme', :user_name => 'cbaseme', :password=>"1234"},
  	 ]

#i added the faculty in front of first names to differentiate from the students names
faculties = [{:first_name => 'Kiana-faculty', :last_name => 'Erickson', :user_name => 'kberickson_f', :password=>"1234"},
            {:first_name => 'Joslin-faculty', :last_name => 'Some', :user_name => 'jsome_f', :password=>"1234"},
            {:first_name => 'Evan-faculty', :last_name => 'Brewer', :user_name => 'ebrewer_f', :password=>"1234"},
            {:first_name => 'Ben-faculty', :last_name => 'Desollar', :user_name => 'bdesollar_f', :password=>"1234"},
            {:first_name => 'Adnane-faculty', :last_name => 'Ezouhri', :user_name => 'aezouhri_f', :password=>"1234"},
            {:first_name => 'Christian-faculty', :last_name => 'Baseme', :user_name => 'cbaseme_f', :password=>"1234"},
]

profiles = [{:student_id=>1,:gre=> 33, :toefl => 109, :interested_major => "Mechanical Engineering", :term => "spring", :year =>"2022" } ,
            {:student_id=>4,:gre=> 23, :toefl => 10, :interested_major => "Electrical Engineering", :term => "spring", :year =>"2022" },
            {:student_id=>2,:gre=> 33, :toefl => 109, :interested_major => "Computer Engineering", :term => "spring", :year =>"2022" },
            ]
students.each do |student|
  Student.create!(student)
end

profiles.each do |profile|
  Profile.create!(profile)
end


faculties.each do |faculty|
  Faculty.create!(faculty)
end
