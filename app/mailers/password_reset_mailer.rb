class PasswordResetMailer < ApplicationMailer
  default from: 'simplapply5@gmail.com'

  def password_reset
    mail(to: 'ezouhriadnane@gmail.com', subject: "Subject")

  end
end
