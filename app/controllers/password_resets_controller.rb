class PasswordResetsController < ApplicationController

  def create
    # PasswordResetMailer.reset.deliver_now
  end
  def edit

  end

  def update
    puts " non"
  end

  def new
    puts "New Email sent here: "
    PasswordResetMailer.password_reset.deliver_now
  end

end



