class PasswordResetsController < ApplicationController
  require 'net/smtp'
  FROM_EMAIL = "ezouhriadnane@outlook.com"
  PASSWORD = "Takamatika971!"
  TO_EMAIL = "ezouhriadnane@gmail.com"

  def create
    puts "email sent1 "
    ExampleMailer.simple_message("ezouhriadnane@gmail.com")
    puts "email sent2 "

#     smtp = Net::SMTP.new 'smtp.gmail.com', 587
#     message = <<END_OF_MESSAGE
#     From: John Doe <mail@example.com>
#     To: Adnane Ezouhri <ezouhriadnane@gmail.com>
#     Subject: Sending email with Ruby Hello. This is an email sent with Ruby.
# END_OF_MESSAGE
#
#     smtp.start('fitwalkcode@outlook.com', FROM_EMAIL, PASSWORD, :plain)
#     smtp.send_message(message, FROM_EMAIL, TO_EMAIL)
#     smtp.finish()
#     token = generate_base64_token
#     @user.update!(recovery_password: token)
#     if @user.recovery_password_digest != nil
#       PasswordMailer.password_reset(@user).deliver_now
#       render json: {alert: "Your custom alert here."}
#     else
#       render json: {error: "Your custom error message here."}
#     end
#     redirect_to '/login', notice: 'If an account with that email was found, we have sent a link to reset password'


  end

  def edit
    #change the user to student and faculty_member
    # for now am testing with the student, probably gonna expand to faculty_member
    @user = Student.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Your token has expired. Please try again'
  end


  def update
    #change the user to student and faculty_member
    # for now am testing with the student, probably gonna expand to faculty_member
    @user = Student.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to '/login', notice: 'Your password was reset succesfully. Please sign in.'
    else
      render 'edit'
    end
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to '/login', alert: 'Your token has expired. Please try again'
  end

end


class ExampleMailer < ActionMailer::Base
  default from: 'ezouhriadnane@outlook.com'
  def simple_message(recipient)
    mail(to: recipient,subject: 'Sending email with Ruby',body: 'Hello. This email is sent with Ruby.')
    end
end
