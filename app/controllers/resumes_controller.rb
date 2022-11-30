class ResumesController < ApplicationController
  def resume_view
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
    puts session
    @student = Student.find_by(id: params[:student_id])
    puts @student.id
  end

  def create
    puts "In create"
    puts params
    puts resume_params
    @resume = Resume.new(resume_params)
    puts "Create Params\n\n"
    puts params[:resume][:student_id]
    puts "\n\n"
    @student = Student.find_by(id: params[:resume][:student_id])
    puts @student.id

    if @resume.save
      redirect_to view_profile_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end

  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :student_id, :attachment)
  end

end
