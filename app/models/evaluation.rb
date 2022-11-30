class Evaluation < ActiveRecord::Base
  has_one :student
  has_one :faculty
  has_one :university
  has_one :application

end

