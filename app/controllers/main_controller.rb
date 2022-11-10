require 'bcrypt'

class MainController < ApplicationController
  include BCrypt
  skip_before_filter :verify_authenticity_token

  # has_secure_password

  @@id = 2

  def initialize
    super
    @student = Student
    @profiles = Profile
    @faculty = Faculty
    @current_profile = nil
  end

  def index

  end
  def login
    @student = Student
    @profiles = Profile
  end
  def sign_up


    @profiles = Profile
    @profiles.all.each do |p|
      puts p.id
    end

  end
  def view_profile
  end


  def intermediate_sign_up
    @student = Student
    @profile= Profile

    puts params[:user]
    missing=false
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
                 :email => params[:user][:email],:password=>params[:user][:password] }
        Faculty.create!(faculty)

        # id=@profile.where(email:params[:user][:email])
        # Commented out as we have yet to decide if we're making
        flash[:notice]= "Faculty Account created successfully"
      else
        #  create a student account
        student={:first_name => params[:user][:first_name], :last_name => params[:user][:last_name],
              :email => params[:user][:email],:password=>params[:user][:password] }

        Student.create!(student)
        id=@student.where(email:params[:user][:email])

        student_profile={:student_id=>id,:gre=>nil, :toefl => nil,
                         :interested_major => nil, :term => nil,
                         :year =>nil }

        Profile.create!(student_profile)

        flash[:notice]= "Student Account created successfully"
      end

    end
    redirect_to root_path

    @current_profile = Profile.where(student_id: @@id).take
    #@experience = Experience.where(student_id: @id).take
    @student = Student.find(@@id)

    if params.include? "gre"
      @current_profile.gre = params[:gre]
      @current_profile.toefl = params[:toefl]
      @current_profile.capa = params[:capa]
      @current_profile.interested_major =params[:major]
      @current_profile.term = params[:term]
      @current_profile.year = params[:year]
      @current_profile.college_name = params[:college_name]
      @current_profile.save
    end
  end

  def edit_profile
    @current_profile = Profile.find(@@id)

  end
  def faculty_profile

  end
  def intermediate_login
    given_email= params[:user][:email]

    @student = Student.where(email: given_email).take
    @faculty = Faculty.where(email: given_email).take
   if not @student.nil?
      @@id = @student.id
      redirect_to view_profile_path
   elsif not @faculty.nil?
     @@id = @faculty.id
     redirect_to faculty_profile_path

   else
         flash[:notice]="Invalid user"
         redirect_to login_path
   end


  end
end
