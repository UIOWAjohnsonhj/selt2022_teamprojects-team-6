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
    if params[:user][:first_name].blank?
      puts "first"
      flash[:notice]= "Empty first name"
      redirect_to main_intermediate_login_path
    elsif params[:user][:last_name].blank?
      puts "last"
      flash[:notice]= "Empty last name"
      redirect_to main_intermediate_login_path
    elsif params[:user][:email].blank?
      puts "email"
      flash[:notice]= "Empty email"
      redirect_to main_intermediate_login_path

    elsif params[:user][:password].blank?
      puts "pwd"
      flash[:notice]= "Empty password"
      redirect_to main_intermediate_login_path
    elsif params[:type].blank?
      puts "radio"
      flash[:notice]= "Empty radio"
      redirect_to main_intermediate_login_path
    end

    puts params
    if params[:type].present?
      if params[:type]=="type_radio_button_faculty"
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
    end

  end

end
