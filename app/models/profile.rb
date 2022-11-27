class Profile < ActiveRecord::Base
  belongs_to :student

  def self.get_all_from_student(student_id)
    @student = Student.find(student_id)
    student_list = []
    @student.profiles.each do |profile|
      student_list.append(profile)
    end

  end

end
