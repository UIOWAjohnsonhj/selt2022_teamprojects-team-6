class Faculty < ActiveRecord::Base

  has_secure_password
  belongs_to :department



end
