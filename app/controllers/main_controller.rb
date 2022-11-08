class MainController < ApplicationController
  skip_before_filter :verify_authenticity_token

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


  def intermediate_login
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
      #  create a faculty account
      # Faculty.create!()
        flash[:notice]= "Faculty Account created successfully"
      # redirect_to main_index_path
      else
      #  create a student account
      # Student.create!()
        flash[:notice]= "Student Account created successfully"
        # redirect_to main_index_path
      end
    else

      redirect_to main_intermediate_login_path
    end
  #  redirect to main page
  end

end
