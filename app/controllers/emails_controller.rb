class EmailsController < ActionMailer::Base
  def email_applicant
    mail(
      :to => 'kiana-erickson@uiowa.edu',
      #:subject => params[:subject],
      #:body => params[:message]
      :subject => 'Test',
      :body => 'test'
    )
  end
end
