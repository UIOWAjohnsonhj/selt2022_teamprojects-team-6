class EmailStudentsMailer < ApplicationMailer
  def notify_user(user)
    @user = user
    mail(to: @user.email, subject: 'Test Email')
  end
end
