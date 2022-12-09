class PredictorController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def predict_probability
    if !student_signed_in?
      redirect_to root_path and return
    end
    @student = "None"
    if params[:search] != ""
      @student = Student.find_by(id: current_student.id)
      @profile = Profile.find_by(student_id: current_student.id)
      @searched_school = params[:search]
      predicted_probability = Predictor.predict(@profile, @searched_school)
      @predicted_decision = predicted_probability["decision"]
      @accuracy = (predicted_probability["accuracy"]).to_s
    end
  end
end
