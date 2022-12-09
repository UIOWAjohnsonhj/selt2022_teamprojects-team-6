class ProfilesController < ApplicationController

  def profile_viewer
    @student = Student.find(params[:student_id])
    @professor = FacultyMember.find(current_faculty_member.id)
    @current_profile = Profile.where(student_id: params[:student_id]).take
    @application = Application.where(student_id: params[:student_id]).take
    @experiences = Experiences.where(student_id: params[:student_id])
    @resume = Resume.where(student_id: params[:student_id]).take
    @evaluations = Evaluation.where(student_id: params[:student_id])
    if @resume.nil?
      @resume = "No resume uploaded"
    end
  end
end
