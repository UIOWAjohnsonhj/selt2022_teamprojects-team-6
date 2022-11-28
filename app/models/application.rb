class Application < ActiveRecord::Base
  belongs_to :student
  belongs_to :university
  belongs_to :department
end

