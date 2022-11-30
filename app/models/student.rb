class Student < ActiveRecord::Base

  has_secure_password
  has_one :profile
  has_many :experiences
  has_many :undergraduate_schools
  has_many :applications
  has_one :resume

end
