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
faculties = [{:first_name => 'Kian', :last_name => 'Weimer', :email => 'kianW123@uiowa.edu', :focus_area=>"Computer Hardware", :password=>"123456",:chair=>true,:research_url=>"http://www.cs.uiowa.edu", :university=>"University of Iowa",:department_id=>1},
            {:first_name => 'Evan', :last_name => 'Bradley', :email => 'evanB123@uiowa.edu', :focus_area=>"Control Systems", :password=>"123456",:chair=>true,:research_url=>"http://www.engineering.uiowa.edu", :university=>"University of Iowa",:department_id=>3},
]



universities = [{:name=> "University of Iowa",:rank=>12,:state=>"Iowa"},
                {:name=> "University of Chicago",:rank=>5,:state=>"Illinois"},
                {:name=> "Stanford University",:rank=>2,:state=>"California"},
                {:name=> "Cornell University",:rank=>12,:state=>"Iowa"},
                {:name=> "University of California, Berkely",:rank=>5,:state=>"California"},
                {:name=> "University of Michigan",:rank=>8,:state=>"Michigan"},
                {:name=> "University of Florida",:rank=>19,:state=>"Florida"},
                ]
department = [{:university_id=>1,:name=>"Electrical Engineering"},{:university_id=>1,:name=>"Mechanical Engineering"},
              {:university_id=>1,:name=>"Computer Science Engineering"},
              {:university_id=>2,:name=>"Electrical and Computer Engineering"},{:university_id=>2,:name=>"Health"},
              {:university_id=>2,:name=>"Hardware Engineering"},{:university_id=>2,:name=>"Physics"},
              {:university_id=>3,:name=>"Environmental Sciences"},{:university_id=>3,:name=>"Anthropology"},
              {:university_id=>3,:name=>"Machine Learning"},{:university_id=>3,:name=>"Industrial Engineering"},
              {:university_id=>4,:name=>"Math"},{:university_id=>2,:name=>"Chemistry"},
              {:university_id=>4,:name=>"Natural Sciences"},{:university_id=>4,:name=>"Language processing"},
              {:university_id=>5,:name=>"Criminology"},{:university_id=>5,:name=>"Psychology"},
              {:university_id=>5,:name=>"Game Theory"},{:university_id=>5,:name=>"Physical Therapy"},
              {:university_id=>6,:name=>"Consulting"},{:university_id=>6,:name=>"Business"},
              {:university_id=>6,:name=>"Sociology"}

]


# students.each do |student|
#   Student.create!(student)
# end


universities.each do |uni|
  University.create!(uni)
end

department.each do |department|
  Department.create!(department)
end

# faculties.each do |faculty|
#   FacultyMember.create!(faculty)
# end
