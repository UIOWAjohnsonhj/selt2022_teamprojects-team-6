class PasswordRecoveryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_recovery_mailer.password_recovery.subject
  #
  def password_recovery
    @greeting = "Hi"

    #mail to: "ezouhriadnane@gmail.com"
    mail to: "cbaseme@uiowa.edu"
  end
end
