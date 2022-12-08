class PasswordMailer < ActionMailer::Base
  default from: 'simplapply5@gmail.com'

  def password_reset(user_email)
    @user= user_email

    mail(to: @user.email, subject:"Subject")
  end
end
