class PasswordMailer < ApplicationMailer
  default from: 'mail@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  # def reset()
  #   #@user = 'fitwalkcode@outlook.com' #params[:user]
  #   #@token = @user.signed_id(purpose: 'password',expires_in:15.minutes) #this token has time to live of 15 minutes
  #   #@url = 'http://example.com/login'
  #   recipient = 'fitwalkcode@outlook.com'
  #   puts 'here are i am line 13'
  #   mail(to: recipient,subject: 'Sending email with Ruby',body: 'Hello. This email is sent with Ruby.')
  #   #mail to: @user.email
  #
  # end
  def simple_message(recipient)
    mail(
      to: recipient,
      subject: 'Sending email with Ruby',
      body: 'Hello. This email is sent with Ruby.'
    )
  end
end
