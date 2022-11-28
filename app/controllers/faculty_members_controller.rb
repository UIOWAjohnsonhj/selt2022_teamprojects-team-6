class FacultyMembersController < ApplicationController

  def show
  end

  def create
    new_faculty = FacultyMember.create(:first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
                                       :email => params[:user][:email], :password_digest=>params[:user][:password])
    flash[:notice] = 'FacultyMember Account Created Successfully'
    render 'my_evaluations'
  end

  def new_faculty
    render 'main/sign_up'
  end

  def faculty_profile
    @faculty = FacultyMember.where(id: @@id).take
    if @faculty.nil?
      flash[:notice] = "FacultyMember Account not Found"
      redirect_to controller: "main", action: 'index' and return
    end
    @user_name = @faculty.user_name
    @name = "#{@faculty.first_name} #{@faculty.last_name}"
    @department = @faculty.department
  end

  def faculty_evaluations
    faculty = FacultyMember.find_by(id: params[:faculty_id])
    student_eval = Student.find_by(id: params[:selected_student_id])
    @evaluations = Evaluation.where(student_id: student_eval.id)
    @user_name = faculty.user_name
    @student_name = "#{student_eval.first_name} #{student_eval.last_name}"
  end

  def my_evaluations
    faculty = FacultyMember.find_by(id: params[:faculty_id])
    @evaluations = Evaluation.where(faculty_id: faculty.id)
    @user_name = faculty.user_name
  end
end

