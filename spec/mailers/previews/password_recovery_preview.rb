# Preview all emails at http://localhost:3000/rails/mailers/password_recovery
class PasswordRecoveryPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/password_recovery/password_recovery
  def password_recovery
    PasswordRecoveryMailer.password_recovery
  end

end
