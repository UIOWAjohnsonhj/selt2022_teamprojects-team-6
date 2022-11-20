# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

students = [{:first_name => 'Kiana', :last_name => 'Erickson', :email => 'kberickson@uiowa.edu', :password_digest=>"1234"},
          {:first_name => 'Joslin', :last_name => 'Some', :email => 'jsome@uiowa.edu', :password_digest=>"1234"},
          {:first_name => 'Evan', :last_name => 'Brewer', :email => 'ebrewer@uiowa.edu', :password_digest=>"1234"},
          {:first_name => 'Ben', :last_name => 'Desollar', :email => 'bdesollar@uiowa.edu', :password_digest=>"1234"},
          {:first_name => 'Adnane', :last_name => 'Ezouhri', :email => 'aezouhri@uiowa.edu', :password_digest=>"1234"},
          {:first_name => 'Christian', :last_name => 'Baseme', :email => 'cbaseme@uiowa.edu', :password_digest=>"1234"},
  	 ]

#i added the faculty in front of first names to differentiate from the students names
faculties = [{:first_name => 'Kiana-faculty', :last_name => 'Erickson', :email => 'kberickson_f@uiowa.edu', :password_digest=>"1234"},
            {:first_name => 'Joslin-faculty', :last_name => 'Some', :email => 'jsome_f@uiowa.edu', :password_digest=>"1234"},
            {:first_name => 'Evan-faculty', :last_name => 'Brewer', :email => 'ebrewer_f@uiowa.edu', :password_digest=>"1234"},
            {:first_name => 'Ben-faculty', :last_name => 'Desollar', :email => 'bdesollar_f@uiowa.edu', :password_digest=>"1234"},
            {:first_name => 'Adnane-faculty', :last_name => 'Ezouhri', :email => 'aezouhri_f@uiowa.edu', :password_digest=>"1234"},
            {:first_name => 'Christian-faculty', :last_name => 'Baseme', :email => 'cbaseme_f@uiowa.edu', :password_digest=>"1234"},
]

profiles = [{:student_id=>1,:gre=> 33, :toefl => 109, :interested_major => "Mechanical Engineering", :term => "spring", :year =>"2022" } ,
            {:student_id=>4,:gre=> 23, :toefl => 10, :interested_major => "Electrical Engineering", :term => "spring", :year =>"2022" },
            {:student_id=>2,:gre=> 33, :toefl => 109, :interested_major => "Computer Engineering", :term => "spring", :year =>"2022" },
            ]

undergrad_schools = [{:student_id=>1, :country=>"United States", :university_name=>"University of Iowa", :major=>"Mechanical Engineering", :gpa => 3.53,
                      :grading_scale=>"Letter Grading", :start_year=>2019, :expected_grad_year=>2023},
                     {:student_id=>2, :country=>"China", :university_name=>"Peking University", :major=>"Biology", :gpa => 3.89,
                      :grading_scale=>"Pass/Fail", :start_year=>2014, :expected_grad_year=>2018}
                    ]
universities = [{:name=> "University of Iowa",:rank=>12,:state=>"Iowa"},
                {:name=> "University of Illinois",:rank=>5,:state=>"Illinois"},
                {:name=> "Stanford",:rank=>2,:state=>"California"},
                {:name=> "Cornell",:rank=>12,:state=>"Iowa"},
                {:name=> "University of California Berkly",:rank=>5,:state=>"California"},
                {:name=> "University of Michigan",:rank=>8,:state=>"Michigan"},
                {:name=> "University of Florida",:rank=>19,:state=>"Florida"},
                ]
department = [{:university_id=>1,:name=>"Electrical Engineering"},{:university_id=>1,:name=>"Mechanical Engineering"},
  {:university_id=>1,:name=>"Computer Science Engineering"},{:university_id=>1,:name=>"Industrial Engineering"},
  {:university_id=>2,:name=>"Electrical Engineering"},{:university_id=>2,:name=>"Mechanical Engineering"},
  {:university_id=>2,:name=>"Hardware Engineering"},{:university_id=>2,:name=>"Physics"}]
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
department.each do |department|
  Department.create!(department)
end
universities.each do |uni|
  University.create!(uni)
end
