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
  @@experience_count = 0
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

  def intermediate_sign_up

      faculty={:first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
               :email => params[:user][:email],:password=>params[:user][:password],
               :university=>params[:uni], :department_id=> params[:dept]}
      FacultyMember.create!(faculty)
      # id=@profiles.where(email:params[:user][:email])
      # Commented out as we have yet to decide if we're making
      # should redirect_to 'faculty_create'
      flash[:notice]= "FacultyMember Account created successfully"

    redirect_to root_path

    end
  def sign_up
    session[:sign_up_type] = :student
  end

  def sign_up_faculty
    session[:sign_up_type] = :faculty
  end
  def view_profile
    if !student_signed_in?
      redirect_to root_path and return
    end
    puts params

    puts session[:user_type]
    session[:logged] = ""
    @student = current_student
    @current_profile = Profile.where(student_id: @student.id).take
    @resume = Resume.where(student_id: session[:student_id]).take
    if @resume.nil?
      @resume = "No resume uploaded"
    end
    @applied_departments ={}
    if params.include? "gre"
      @current_profile.gre = params[:gre]
      @current_profile.toefl = params[:toefl]
      @current_profile.capa = params[:capa]
      @current_profile.interested_major =params[:major]
      @current_profile.term = params[:term]
      @current_profile.year = params[:year]
      @current_profile.college_name = params[:college_name]
      @current_profile.save
      Experiences.destroy_all(student: current_student)
      params[:company].length.times do |i|
        hash = {:student=>current_student,:company_name=>params[:company][i],
                :description=>params[:description][i],:job_title=> params[:title][i],
                :from=>params[:from][i],:to=>params[:to][i]}
        Experiences.create!(hash)
      end

    elsif params.include? "department"
      @university= University.find(params[:university_id])
      @department = Department.find(params[:department])
      application = {:student_id=>current_student.id, :university_id=> @university.id,:department_id=>@department.id,:application_status=>"pending"}
      @applications.create!(application)
    end
    @applications = Application.where(student_id: current_student.id)

    @applications.each do |app|
      current_uni = University.find(app.university_id)
      current_dep = Department.find(app.department_id)

      if @applied_departments.include? current_uni.name.to_sym
        @applied_departments[current_uni.name.to_sym].append([current_dep.name, app.application_status])
      else
        @applied_departments[current_uni.name.to_sym] = [[current_dep.name, app.application_status]]
      end
    end
    puts @applied_departments
    puts "ddsfddf"
  end

  def add_experience
    @@experience_count+=1
    redirect_to edit_profile_path
  end

  def remove_experience
    if @@experience_count>0
      @@experience_count-=1
    end
    redirect_to edit_profile_path
  end
  def general_sign_up

  end
  def general_login

  end

  def edit_profile
    if !student_signed_in?
      redirect_to root_path and return
    end
    if params.include? "hidden"
      @experience_count = Experiences.where(student: current_student).count
      Experiences.all.each do |i|
        puts "---------------------------------------------"
        puts i,@experience_count
      end
      @@experience_count=@experience_count
    else
      @experience_count = @@experience_count
    end
    @student = current_student
    @resume = Resume.where(student_id: @student.id).take
    if @resume.nil?
      @resume = "No resume uploaded"
    end
    @current_profile = Profile.where(student_id: @student.id).take
  end

  def intermediate_login

    given_email= params[:user][:email]
    given_password = params[:user][:password]
    @student = Student.find_by(email:given_email)
    @faculty = FacultyMember.find_by(email:given_email)

    begin
      if not @student.nil? #student1 && student1.authenticate(given_password)
        #&.authenticate(given_password)
        @@user_type = :student
        @@id = @student.id
        #p @student
        session[:student_id] = @student.id
        session[:user_type] = :student
        redirect_to view_profile_path(@student, student_id: @student.id)
      #elsif not @faculty.nil?
      elsif not @faculty.nil?
        #&.authenticate(given_password)
        puts 'line 148'
        @@id = @faculty.id
        @@user_type = :faulty
        session[:faculty_id] = @faculty.id
        session[:user_type] = :faculty
        redirect_to faculty_profile_path(@faculty, faculty_id: @faculty.id)

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
    if !student_signed_in?
      redirect_to root_path and return
    end
    @universities= @@universities
    @all_universities = []
    University.all.each do |u|
      @all_universities.append(u.name.downcase)
    end
    puts @all_universities
  end
  def view_university
    if !student_signed_in?
      redirect_to root_path and return
    end
    @university = University.where(name:params[:name]).take
    @departments = Department.where(university_id: @university.id)
    @departments.all.each do |d|
      puts d.name
    end
  end

  def intermediate_search
    if !student_signed_in?
      redirect_to root_path and return
    end
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

    end
    redirect_to search_universities_path

  end
  def change_page
    if !student_signed_in?
      redirect_to root_path and return
    end
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
  def search_instructor
    if !student_signed_in?
      redirect_to root_path and return
    end
      ordering,@name_header = {:name => :asc}, 'hilite'
      @all_focus_areas = ["All","Applied Physics", "Big Data/Data Mining/Machine Learning", "Bioinformatics", "Business", "Communication Systems",
                          "Computer Breadth", "Computer Hardware", "Computer Networks", "Control Systems", "Electrical Breadth", "Electrical Circuits",
                          "Entrepreneurship", "Integrated Circuits", "Internet of Things", "Photonic Systems", "Power Systems", "Pre-Law",
                          "Pre-Medicine", "Quantum Computing and Devices", "RF Electronics", "Semiconductor Devices", "Signal & Imaging Processing",
                          "Software Engineering", "Sustainability"]
      @selected_focus_areas = params[:focus_areas] || session[:focus_areas] || {}

      if @selected_focus_areas == {}
        @selected_focus_areas = Hash[@all_focus_areas.map {|focus_area| [focus_area, focus_area]}]
      end

      if params[:focus_areas] != session[:focus_areas]
        session[:focus_areas] = @selected_focus_areas
        redirect_to :sort => sort, :focus_areas => @selected_focus_areas and return
      end
      @faculties = FacultyMember.all.where(focus_area: @selected_focus_areas.keys).order(ordering)
  end
end
