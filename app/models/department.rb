class Department < ActiveRecord::Base

  belongs_to :university
  has_many :faculty
  has_many :applications
end

