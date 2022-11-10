require 'bcrypt'

class MainController < ApplicationController
  include BCrypt
  skip_before_filter :verify_authenticity_token
  # has_secure_password
  def index

  end
  def login
    @student = Student
    @profiles = Profile
    @profiles.all.each do |s|
      puts s.interested_major
    end
  end
  def sign_up
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

  end

end
