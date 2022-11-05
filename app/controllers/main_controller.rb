class MainController < ApplicationController
  def index

  end
  def login
    @student = Student
    @student.all.each do |s|
      puts s.first_name
    end
  end
  def sign_up

  end
end
