class EmailStudentsMailer < ApplicationMailer
  default from: 'SimplApplySELT@gmail.com'
  def notify_user(user)
    # @user = user
    mail(to: user, subject: 'Test Email')
  end

  def user_accepted(student_email)
    mail(to: student_email, subject: 'Admission Decision')
  end

  def user_denied(student_email)
    mail(to: student_email, subject: 'Admission Decision')
  end

  def user_waitlisted(student_email)
    mail(to: student_email, subject: 'Admission Decision')
  end

end
