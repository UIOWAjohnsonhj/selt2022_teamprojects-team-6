class University < ActiveRecord::Base
  has_many :departments
  has_many :faculty, through: :departments
end

