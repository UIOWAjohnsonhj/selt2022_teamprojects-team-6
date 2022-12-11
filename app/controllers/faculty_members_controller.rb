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
    if !faculty_member_signed_in?
      flash[:notice] = "Faculty Account not Found"
      redirect_to controller: "main", action: 'index' and return
    else
      redirect_to controller: "faculty_members", action: 'my_evaluations' and return
    end

    @id = current_faculty_member.id # need to remove this and put it in a before_filter with authentication
    @display_name = @faculty.first_name
    @name = "#{@faculty.first_name} #{@faculty.last_name}"
    @department = @faculty.department || Department.find(@faculty.department_id)
  end

  def faculty_evaluations
    @faculty = FacultyMember.find_by(id: current_faculty_member.id)
    @student = Student.find_by(id:  params[:student_id])
    @display_name = @faculty.first_name
    @evaluations = Evaluation.where(student_id: params[:student_id])
    @faculty_eval_dict = {}
    @evaluations.each do |eval|
      @faculty = FacultyMember.find(eval.faculty_id)
      @faculty_eval_dict[@faculty] = eval
    end
    @student_name = "#{@student.first_name} #{@student.last_name}"
  end

  def my_evaluations
    @id = current_faculty_member.id
    @faculty = FacultyMember.find_by(id: @id)
    @evaluations = Evaluation.where(faculty_id: @faculty.id)
    @student_eval_dict = {}
    @evaluations.each do |eval|
      puts eval.student_id
      puts eval.faculty_id
      @student = Student.find(eval.student_id)
      @student_eval_dict[@student] = eval
    end
    @display_name = @faculty.first_name
  end

  def admission_decision
    # Below will be added when application is created and we have a university id
    # @application_list = Application.where(university_id: @faculty.university_id, department_id: @faculty.department_id)
    @id = current_faculty_member.id
    @faculty = FacultyMember.find_by(id: @id)
    @application_list = Application.where(department_id: @faculty.department_id)
    @student_app_dict = {}
    @application_list.each do |app|
      @student = Student.find(app.student_id)
      @student_app_dict[@student] = app
    end
  end
  def accept_application
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Accepted')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_accepted(student_email, @application).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def reject_application
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Rejected')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_denied(student_email, @application).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def waitlist_application
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Waitlisted')
    student_email = Student.find(params[:student_id]).email
    EmailStudentsMailer.user_waitlisted(student_email, @application).deliver_now
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def evaluate_student
    @student = Student.find_by(id: params[:student_id])
    @faculty = FacultyMember.find_by(id: current_faculty_member.id)
    @profile = Profile.find_by(student_id: @student.id)
    @application = Application.where(student_id: @student.id, department_id: @faculty.department_id).take
    @evaluation = Evaluation.where(student_id: @student.id, faculty_id: @faculty.id).take
    if @evaluation.nil?
      @evaluation = Evaluation.new
      @evaluation.student_id = @student.id
      @evaluation.faculty_id = @faculty.id
      @evaluation.comment = params[:comment]
      @evaluation.university_id = @faculty.university
      @evaluation.applied_term = @profile.term
      @evaluation.status = params[:decision]
      @evaluation.score = params[:score]
      @evaluation.application_id = @application.id
      @evaluation.save
    else
      @evaluation.update(comment: params[:comment], status: params[:decision], score: params[:score])
    end
    redirect_to my_evaluations_path
  end

  def create_email
    @student = Student.find(params[:student_id])
    render 'email_applicant'
  end

  require 'mail'
  def email_student
    @student = Student.find(params[:email][:student_id])
    email= @student.email
    EmailStudentsMailer.notify_user(email, params[:email][:subject], params[:email][:message]).deliver_now
    render 'my_evaluations'
  end
end

