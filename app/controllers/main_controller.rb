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
end
