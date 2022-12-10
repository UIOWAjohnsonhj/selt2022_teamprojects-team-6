class PasswordResetMailer < ActionMailer::Base
  default from: 'simplapply5@gmail.com'

  def password_reset
    mail(to: '"cbaseme@uiowa.edu"', subject: "Subject")

  end
end
