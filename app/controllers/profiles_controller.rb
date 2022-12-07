class ProfilesController < ApplicationController

  def profile_viewer
    puts "In view"
    puts params
    puts params[:id]
    @student = Student.find(params[:student_id])
    @professor = FacultyMember.find(params[:professor_id])
    @current_profile = Profile.where(student_id: params[:student_id]).take
    @application = Application.where(student_id: params[:student_id]).take
    @resume = Resume.where(student_id: params[:student_id]).take
    if @resume.nil?
      @resume = "No resume uploaded"
    end

  end
end
