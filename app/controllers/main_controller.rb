require 'open-uri'
require 'json'

class MainController < ApplicationController
  include BCrypt
  skip_before_filter :verify_authenticity_token

  def index
  end

  def intermediate_logout
    reset_session
    redirect_to root_path
  end

  def view_profile
    if !student_signed_in?
      redirect_to root_path and return
    end

    session[:logged] = ""
    @student = current_student
    @current_profile = Profile.where(student_id: @student.id).take
    @resume = Resume.where(student_id: @student).take
    if @resume.nil?
      @resume = "No resume uploaded"
    end
    @applied_departments ={}
    if params.include? "gre"
      if params.include? "company" and (params[:company].include? "" or params[:title].include? "" or params[:description].include? "" or params[:from].include? "" or params[:to].include? "")
        flash[:notice] = "Please fill out all fields"
        redirect_to edit_profile_path and return
      end
      @current_profile.gpa = params[:gpa]
      @current_profile.gre = params[:gre]
      @current_profile.toefl = params[:toefl]
      @current_profile.capa = params[:capa]
      @current_profile.interested_major =params[:major]
      @current_profile.term = params[:term]
      @current_profile.year = params[:year]
      @current_profile.college_name = params[:college_name]
      @current_profile.gpa = params[:gpa]
      @current_profile.save
      Experiences.destroy_all(student: current_student)
      if params.include? "company"
        params[:company].length.times do |i|
          hash = {:student=>current_student,:company_name=>params[:company][i],
                  :description=>params[:description][i],:job_title=> params[:title][i],
                  :from=>params[:from][i],:to=>params[:to][i]}
          Experiences.create!(hash)
          end
      end

    elsif params.include? "department"
      @university= University.find(params[:university_id])
      @department = Department.find(params[:department])
      application = {:student_id=>current_student.id, :university_id=> @university.id,:department_id=>@department.id,:application_status=>"pending"}
      @applications.create!(application)
    end
    @experiences = Experiences.where(student: current_student)
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
  end

  def add_experience
    if params.include? "company" and (params[:company].empty? or params[:title].empty? or params[:description].empty? or params[:from].empty? or params[:to].empty?)
      flash[:notice] = "Please fill out all fields"
      redirect_to edit_profile_path and return
    end
    session[:experience_count]+=1
    redirect_to edit_profile_path
  end

  def remove_experience
    if session[:experience_count]>0
      session[:experience_count]-=1
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
    @exp_list=[]
    Experiences.where(student: current_student).all.each do |i|
      @exp_list.append(i)
    end
    if params.include? "hidden"
      @experience_count = Experiences.where(student: current_student).count
      session[:experience_count]=@experience_count
    else
      @experience_count = session[:experience_count]
    end
    @student = current_student
    @resume = Resume.where(student_id: @student.id).take
    if @resume.nil?
      @resume = "No resume uploaded"
    end
    @current_profile = Profile.where(student_id: @student.id).take
  end
  def reset_password
    #redirect_to reset_password_path

  end
  def search_universities
    if !student_signed_in?
      redirect_to root_path and return
    end

    if session[:search_type]=="supported"
      @universities=University
      @search_type = session[:search_type]
      session[:university_count] = @universities.count
    elsif session[:search_type]=="location"
      @search_type = session[:search_type]
    elsif session[:search_type]=="country" or session[:search_type]=="name"
      response = data = JSON.parse(open(session[:url]).read)
      @universities = response["records"]
      @search_type = session[:search_type]
      session[:university_count] = @universities.count
    end
    @page_counter = session[:page_counter]
    @all_universities = []
    University.all.each do |u|
      @all_universities.append(u.name.downcase)
    end
  end
  def view_university
    if !student_signed_in?
      redirect_to root_path and return
    end
    @university = University.where(name:params[:name]).take
    @departments = Department.where(university_id: @university.id)
  end

  def intermediate_search
    if !student_signed_in?
      redirect_to root_path and return
    end
    filter = params[:filter]
    entry = params[:search]
    session[:page_counter] =1
    if filter == "Location"
      session[:search_type]=:location
    elsif filter == "Supported"
      session[:search_type]=:supported
    elsif filter.blank? or entry.blank?
      flash[:notice] = "Please fill out all fields"
      session[:search_type] = nil
    elsif filter == "Country"
      url = 'https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=100&sort=world_rank&facet=world_rank&facet=national_rank&facet=year&facet=country&refine.country='+entry+'&refine.year=2018'
      session[:url]=url
      session[:search_type]=:country
    elsif filter == "university name"
      url = "https://public.opendatasoft.com/api/records/1.0/search/?dataset=shanghai-world-university-ranking&q=&rows=1&sort=world_rank&facet=university_name&facet=world_rank&facet=national_rank&facet=year&facet=country&refine.university_name="+entry+"&refine.year=2018"
      session[:search_type]=:name
      session[:url]=url
    end
    redirect_to search_universities_path

  end
  def change_page
    if !student_signed_in?
      redirect_to root_path and return
    end
    if params.include? "prev"
      if session[:page_counter]>1
        session[:page_counter]-=1
      end
    else
      if session[:page_counter]< session[:university_count]/10
        session[:page_counter]+=1
      end
    end
    redirect_to search_universities_path
  end
  def search_instructor
    if !student_signed_in?
      redirect_to root_path and return
    end
    @faculties = FacultyMember
    ordering,@name_header = {:name => :asc}, 'hilite'
    @all_focus_areas = ["All","Applied Physics", "Big Data/Data Mining/Machine Learning", "Bioinformatics", "Business", "Communication Systems",
                        "Computer Breadth", "Computer Hardware", "Computer Networks", "Control Systems", "Electrical Breadth", "Electrical Circuits",
                        "Entrepreneurship", "Integrated Circuits", "Internet of Things", "Photonic Systems", "Power Systems", "Pre-Law",
                        "Pre-Medicine", "Quantum Computing and Devices", "RF Electronics", "Semiconductor Devices", "Signal & Imaging Processing",
                        "Software Engineering", "Sustainability"]
    @selected_focus_areas = params[:focus_areas] || "All"

    if @selected_focus_areas == "All"
      @faculties = FacultyMember
    else
      @faculties = FacultyMember.where(focus_area: @selected_focus_areas)
    end
    session[:focus_areas] = @selected_focus_areas
  end
end
