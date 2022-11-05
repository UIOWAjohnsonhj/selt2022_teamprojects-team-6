class MainController < ApplicationController
  def index

  end
  def login
    @student = Student
    @student.all.each do |s|
      puts s.id
    end
  end
  def sign_up

  end
end
