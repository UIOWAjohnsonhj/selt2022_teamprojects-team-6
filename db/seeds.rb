# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = [{:first_name => 'Kiana', :last_name => 'Erickson', :user_name => 'kberickson'},
          {:first_name => 'Joslin', :last_name => 'Some', :user_name => 'jsome'},
          {:first_name => 'Evan', :last_name => 'Brewer', :user_name => 'ebrewer'},
          {:first_name => 'Ben', :last_name => 'Desollar', :user_name => 'bdesollar'},
          {:first_name => 'Adnane', :last_name => 'Ezouhri', :user_name => 'aezouhri'},
          {:first_name => 'Christian', :last_name => 'Baseme', :user_name => 'cbaseme'},
  	 ]

#i added the faculty in front of first names to differentiate from the students names
faculties = [{:first_name => 'Kiana-faculty', :last_name => 'Erickson', :user_name => 'kberickson_f'},
            {:first_name => 'Joslin-faculty', :last_name => 'Some', :user_name => 'jsome_f'},
            {:first_name => 'Evan-faculty', :last_name => 'Brewer', :user_name => 'ebrewer_f'},
            {:first_name => 'Ben-faculty', :last_name => 'Desollar', :user_name => 'bdesollar_f'},
            {:first_name => 'Adnane-faculty', :last_name => 'Ezouhri', :user_name => 'aezouhri_f'},
            {:first_name => 'Christian-faculty', :last_name => 'Baseme', :user_name => 'cbaseme_f'},
]

profiles = [{:student_id=>1,:gre=> 33, :toefl => 109, :interested_major => "Mechanical Engineering", :term => "spring", :year =>"2022" } ,
            {:student_id=>4,:gre=> 23, :toefl => 10, :interested_major => "Electrical Engineering", :term => "spring", :year =>"2022" },
            {:student_id=>1,:gre=> 33, :toefl => 109, :interested_major => "Computer Engineering", :term => "spring", :year =>"2022" },
            ]

undergrad_schools = [{:student_id=>1, :country=>"United States", :university_name=>"University of Iowa", :major=>"Mechanical Engineering", :gpa => 3.53,
                      :grading_scale=>"Letter Grading", :start_year=>2019, :expected_grad_year=>2023},
                     {:student_id=>2, :country=>"China", :university_name=>"Peking University", :major=>"Biology", :gpa => 3.89,
                      :grading_scale=>"Pass/Fail", :start_year=>2014, :expected_grad_year=>2018}
                    ]

undergrad_schools.each do |school|
  UndergraduateSchool.create!(school)
end

students.each do |student|
  Student.create!(student)
end

profiles.each do |profile|
  Profile.create!(profile)
end


faculties.each do |faculty|
  Faculty.create!(faculty)
end
