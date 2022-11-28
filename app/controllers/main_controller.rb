require 'open-uri'
require 'json'
class MainController < ApplicationController
  include BCrypt
  skip_before_filter :verify_authenticity_token
  @@id = nil
  @@universities=nil
  @@user_type = nil
  @@search_type = nil
  @@page_counter = 1


  def initialize
    super
    @student = Student
    @profiles = Profile
    @faculty = FacultyMember
    @current_profile = nil
    @id = @@id
    @user_type = @@user_type
    @search_type = @@search_type
    @applications= Application
    @page_counter =@@page_counter

  end
  def index

  end
  def login
    @student = Student
    @profiles = Profile
  end
  def intermediate_logout
    @@id = nil
    @@page_counter=1
    reset_session
    redirect_to root_path
  end
  def sign_up
    @profiles = Profile
    @profiles.all.each do |p|
      puts p.id
    end
  end
  def view_profile
    @current_profile = Profile.where(student_id: @@id).take
    #@experience = Experiences.where(student_id: @id).take
    puts @@id,"View"
    #@experience = Experience.where(student_id: @id).take
    @student = Student.find(@@id)
    @applied_Departments ={}
    if params.include? "gre"
      @current_profile.gre = params[:gre]
      @current_profile.toefl = params[:toefl]
      @current_profile.capa = params[:capa]
      @current_profile.interested_major =params[:major]
      @current_profile.term = params[:term]
      @current_profile.year = params[:year]
      @current_profile.college_name = params[:college_name]
      @current_profile.save
    elsif params.include? "department"
      @university= University.find(params[:university_id])
      @department = Department.find(params[:department])
      application = {:student_id=>@@id, :university_id=> @university.id,:department_id=>@department.id,:application_status=>"pending"}
      @applications.create!(application)
    end
    @applications = Application.where(student_id: @@id)

    @applications.each do |app|
      current_uni= University.find(app.university_id)
      current_dep = Department.find(app.department_id)

      if @applied_Departments.include? current_uni.name.to_sym
        @applied_Departments[current_uni.name.to_sym].append([current_dep.name,app.application_status])
      else
        @applied_Departments[current_uni.name.to_sym] = [[current_dep.name,app.application_status]]
      end
    end
    puts @applied_Departments
  end


  def intermediate_sign_up
    @student = Student
    @profile= Profile

    puts params[:user]
    missing=false
    if Student.where(:email => (params[:user][:email])).exists? || FacultyMember.where(:email => (params[:user][:email])).exists?
      puts "email"
      flash[:notice]= "Email already in use"
      missing=true
    end
    if params[:user][:first_name].blank?
      puts "first"
      flash[:notice]= "Empty first name"
      missing=true
      # redirect_to main_intermediate_login_path
    elsif params[:user][:last_name].blank?
      puts "last"
      flash[:notice]= "Empty last name"
      missing=true
      # redirect_to main_intermediate_login_path
    elsif params[:user][:email].blank?
      puts "email"
      flash[:notice]= "Empty email"
      missing=true
      # redirect_to main_intermediate_login_path

    elsif params[:user][:password].blank?
      puts "pwd"
      flash[:notice]= "Empty password"
      missing=true
      # redirect_to main_intermediate_login_path
    elsif params[:type].blank?
      puts "radio"
      flash[:notice]= "Empty radio"
      missing=true
      # redirect_to main_intermediate_login_path
    end

    puts params
    if params[:type].present? && !missing
      if params[:type]=="radio_button_faculty"
        faculty={:first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
                 :email => params[:user][:email],:password_digest=>params[:user][:password] }
        FacultyMember.create!(faculty)

        # id=@profiles.where(email:params[:user][:email])
        # Commented out as we have yet to decide if we're making
        # should redirect_to 'faculty_create'
        flash[:notice]= "FacultyMember Account created successfully"
      else
        #  create a student account
        student={:first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
              :email => params[:user][:email],:password_digest=>params[:user][:password] }

        Student.create!(student)
        id=@student.where(email:params[:user][:email]).take.id
        puts id,"create"
        student_profile={:student_id=>id,:gre=>nil, :toefl => nil,
                         :interested_major => nil, :term => nil,
                         :year =>nil }

        Profile.create!(student_profile)

        flash[:notice]= "Student Account created successfully"
      end

    end
    redirect_to root_path


  end

  def edit_profile
    @current_profile = Profile.where(student_id: @@id).take

  end

  def intermediate_login
    given_email= params[:user][:email]
    given_password = params[:user][:password]

    #@student = Student.where( email:given_email).take

    #@faculty = Faculty.where( email: given_email).take
    #puts 'line 134: ', @student
    #p 'line 135  ', @faculty
    #if (not @student.nil?) || (not @faculty.nil?)
    @student = Student.find_by(email:given_email,password_digest:given_password)
    @faculty = FacultyMember.find_by(email:given_email,password_digest:given_password)

    begin
      puts 'line 139'
      if not @student.nil? #student1 && student1.authenticate(given_password)
        #&.authenticate(given_password)
        puts 'line 141'
        @@user_type = :student
        @@id = @student.id
        #p @student
        redirect_to view_profile_path
      #elsif not @faculty.nil?
      elsif not @faculty.nil?
        #&.authenticate(given_password)
        puts 'line 148'
        @@id = @faculty.id
        @@user_type = :faulty
        session[:faculty_id] = @faculty.id
        session[:user_type] = :faculty
        redirect_to faculty_profile_path

      else
         flash[:notice]="Invalid user"
         redirect_to login_path
      end
    rescue BCrypt::Errors::InvalidHash
      flash[:error] = 'We recently adjusted the way our passwords are store. Please Reset your password '
    end
    #else
    # flash[:notice]="Invalid user 2"
    #  redirect_to login_path

  end
  def reset_password
    #redirect_to reset_password_path

  end
  def search_universities
    @universities= @@universities
    @all_universities = []
    University.all.each do |u|
      @all_universities.append(u.name.downcase)
    end
    puts @all_universities
  end
  def view_university
    @university = University.where(name:params[:name]).take
    @departments = Department.where(university_id: @university.id)
    @departments.all.each do |d|
      puts d.name
    end
  end

  def admission_decision
    puts params
    puts "Admission decision"
    @professor = FacultyMember.where(id: params[:professor_id]).take
    if @professor.nil?
      @professor = FacultyMember.where(id:  params[:format]).take
    end
    # Below will be added when application is created and we have a university id
    # @application_list = Application.where(university_id: @professor.university_id, department_id: @professor.department_id)
    @application_list = Application.where(department_id: @professor.department_id)
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
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def reject_application
    puts params
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Rejected')
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def waitlist_application
    puts params
    @application = Application.where(student_id: params[:student_id]).take
    @application.update(application_status: 'Waitlisted')
    redirect_to admission_decision_path(student_id: params[:student_id], professor_id: params[:professor_id])
  end

  def intermediate_search
    filter = params[:filter]
    entry = params[:search]
    @@page_counter =1
    if filter == "Location"
      @@search_type = :location
    elsif filter == "Supported"
      @@search_type = :supported
      @@universities = University
    elsif filter.blank? or entry.blank?
      flash[:notice] = "Please fill out all fields"
      @@search_type = nil
    elsif filter == "Country"
      url = 'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=100&sort=world_rank&facet=world_rank&facet=national_rank&facet=year&facet=country&refine.country='+entry+'&refine.year=2018'
      response = data = JSON.parse(open(url).read)
      @@universities = response["records"]
      @@search_type = :country
    elsif filter == "university name"
      url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=1&sort=world_rank&facet=university_name&facet=world_rank&facet=national_rank&facet=year&facet=country&refine.university_name="+entry+"&refine.year=2018"
      response = data = JSON.parse(open(url).read)
      @@universities = response["records"]
      @@search_type = :name

    redirect_to search_universities_path
  end

  end
  def change_page
    puts params.include? "prev"
    if params.include? "prev"
      if @@page_counter>1
        @@page_counter-=1
      end
    else
      if @@page_counter< @@universities.length/10
        @@page_counter+=1
      end
    end
    redirect_to search_universities_path
  end
end
