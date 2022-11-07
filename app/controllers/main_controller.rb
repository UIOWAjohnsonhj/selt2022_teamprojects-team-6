class MainController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def initialize
    super
    @student = Student
    @profiles = Profile
    @id = 2
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

    @current_profile = Profile.where(student_id: @id).take
    #@experience = Experience.where(student_id: @id).take
    @student = Student.find(@id)

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
    @current_profile = Profile.find(@id)

  end
end
