class ResumesController < ApplicationController
  def resume_view
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
    @student = Student.find_by(id: current_student.id)
  end

  def create
    @resume = Resume.new(resume_params)
    puts session
    @student = Student.find_by(id: current_student.id)
    Resume.destroy_old_resume(@student.id)
    if @resume.save
      redirect_to view_profile_path(@student, student_id: @student.id), notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path(@student, student_id: @student.id), notice:  "The resume #{@resume.name} has been deleted."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :student_id, :attachment)
  end

end
