class PasswordResetsController


  def send_password_reset
    PasswordMailer.password_reset("ezouhriadnane@gmail.com").deliver_now
  end

end
