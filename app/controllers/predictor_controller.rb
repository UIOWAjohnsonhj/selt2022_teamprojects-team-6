class PredictorController < ApplicationController

  def predict_probability
    @predicted_probability = Predictor.predict(1)
    puts @predicted_probability
  end
end
