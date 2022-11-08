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
    # puts params[:user_first_name]
    if params[:user][:first_name].blank?
      puts "first"
      flash[:notice]= "Empty first name"
       return
    elsif params[:user][:last_name].blank?
      puts "last"
      flash[:notice]= "Empty last name"
      return
    elsif params[:user][:email].blank?
      puts "email"
      flash[:notice]= "Empty email"
      return

    elsif params[:user][:password].blank?
      puts "pwd"
      flash[:notice]= "Empty password"
      return
    elsif params[:type].blank?
      puts "radio"
      flash[:warning]= "Empty radio"
      return
    end

    # puts params
    if params[:type]=="type_radio_button_faculty"
    #  create a faculty account
    # Faculty.create!()
    else
    #  create a student account
    # Student.create!()
    end
  end

  # redirect_to main_index_path
end
