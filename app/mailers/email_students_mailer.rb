class EmailStudentsMailer < ApplicationMailer
  default from: 'SimplApplySELT@gmail.com'
  def notify_user(user)
    # @user = user
    mail(to: user, subject: 'Test Email')
  end

  def user_accepted(student_email, application)
    @application = application
    mail(to: student_email, subject: 'Admission Decision')
  end

  def user_denied(student_email)
    mail(to: student_email, subject: 'Admission Decision')
  end

  def user_waitlisted(student_email)
    mail(to: student_email, subject: 'Admission Decision')
  end

  def create_account(student_email)
    mail(to: student_email, subject: 'Account Created')
  end

  def send_faculty_invite(faculty_email, link)
    @link = link
    mail(to: faculty_email, subject: 'Invite to ApplicationHub')
  end

end
