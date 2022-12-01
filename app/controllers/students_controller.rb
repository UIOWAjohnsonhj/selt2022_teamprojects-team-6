class StudentsController < ApplicationController
  def show
    id = params[:id] # retrieve student ID from URI route
    @student = Student.find(id) # look up student by unique ID
  end

  
end
