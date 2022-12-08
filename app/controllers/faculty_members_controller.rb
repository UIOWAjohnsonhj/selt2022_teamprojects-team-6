class FacultyMembersController < ApplicationController
  skip_before_filter :verify_authenticity_token
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
    @faculty = current_faculty_member
    puts "s-------------------------------------------ddddddd",faculty_member_signed_in?
    if !faculty_member_signed_in?
      flash[:notice] = "Faculty Account not Found"
      redirect_to controller: "main", action: 'index' and return
    end

    @id = current_faculty_member.id # need to remove this and put it in a before_filter with authentication
    @display_name = @faculty.first_name
    @name = "#{@faculty.first_name} #{@faculty.last_name}"
    @department = @faculty.department
  end

  def faculty_evaluations
    @user_type = session[:user_type].to_sym # need to remove this and put it in a before_filter with authentication
    @id = session[:faculty_id] # need to remove this and put it in a before_filter with authentication
    @faculty = FacultyMember.find_by(id: session[:faculty_id])
    student_eval = Student.find_by(id: session[:selected_student_id])
    @display_name = @faculty.first_name
    @evaluations = Evaluation.where(student_id: student_eval.id)
    @student_name = "#{student_eval.first_name} #{student_eval.last_name}"
  end

  def my_evaluations
    @id = current_faculty_member.id # need to remove this and put it in a before_filter with authentication
    @faculty = FacultyMember.find_by(id: @id)
    @evaluations = Evaluation.where(faculty_id: @faculty.id)
    @display_name = @faculty.first_name
  end

  def admission_decision
    @id = current_faculty_member.id # need to remove this and put it in a before_filter with authentication
    # Below will be added when application is created and we have a university id
    # @application_list = Application.where(university_id: @faculty.university_id, department_id: @faculty.department_id)
    @faculty = FacultyMember.find_by(id: @id)
    @application_list = Application.where(department_id: @faculty.department_id)
    @student_app_dict = {}
    @application_list.each do |app|
      @student = Student.find(app.student_id)
      @student_app_dict[@student] = app
    end
  end
  def accept_application
    puts params
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Accepted')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_accepted(student_email).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def reject_application
    puts params
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Rejected')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_denied(student_email).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def waitlist_application
    puts params
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Waitlisted')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_waitlisted(student_email).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def sign_up_faculty

  end

  def create_email
    render 'email_applicant'
  end

  require 'mail'
  def email_student
    @student_clicked_on = Student.where(:first_name => 'Kiana')
    puts @student_clicked_on.first.email
    email= @student_clicked_on.first.email
    puts email
    EmailStudentsMailer.notify_user(email).deliver_now
    render main_index_path
  end
end

