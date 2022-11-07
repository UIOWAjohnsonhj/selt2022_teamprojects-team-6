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
    puts params[:user_first_name]
    if params[:user_first_name]==nil
      puts "first"
      flash[:warning]= "Empty first name"
    end
    if params[:user_last_name]==nil
      puts "last"
      flash[:warning]= "Empty last name"
    end
    if params[:user_email]==nil
      puts "email"
      flash[:warning]= "Empty first name"
    end
    if params[:user_password]==nil
      puts "pwd"
      flash[:warning]= "Empty first name"
    end
    if params[:type].blank?
      puts "radio"
      flash[:warning]= "Empty radio"
    end

    # redirect_to main_sign_up_path
  end

end
