class ProfilesController < ApplicationController

  def profile_viewer
    puts "profile before"
    puts params
    @student = Student.find(params[:student_id])
    @professor = FacultyMember.find(current_faculty_member.id)
    @current_profile = Profile.where(student_id: params[:student_id]).take
    @application = Application.where(student_id: params[:student_id]).take
    @experiences = Experiences.where(student_id: params[:student_id])
    @resume = Resume.where(student_id: params[:student_id]).take
    @evaluation = Evaluation.where(student_id: params[:student_id], faculty_id: @professor.id).take
    if @evaluation.nil?
    end
    if @resume.nil?
      @resume = "No resume uploaded"
    end
  end
end
