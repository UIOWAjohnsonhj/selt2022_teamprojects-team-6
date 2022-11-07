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
    if params[:user_fn].blank?
      puts "first"
      # puts params[:user_first_name].to_s
      flash[:warning]= "Empty first name"
      end # return
    if params[:user_last_name].to_s.blank?
      puts "last"
      flash[:warning]= "Empty last name"
      end# return
    if params[:user_email].blank?
      puts "email"
      flash[:warning]= "Empty first name"
      # return
      end
    if params[:user_password].blank?
      puts "pwd"
      flash[:warning]= "Empty first name"
      end  # return
    if params[:type].blank?
      puts "radio"
      flash[:warning]= "Empty radio"
      # return
    end

    puts params[:user_last_name].to_s
    if params[:type]=="type_radio_button_faculty"
    #  create a faculty account
    else
    #  create a student account
    end
  end


end
