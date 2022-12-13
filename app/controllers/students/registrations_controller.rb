# frozen_string_literal: true

class Students::RegistrationsController < Devise::RegistrationsController
   before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    # if params[:student][:email].blank? or params[:student][:first_name].blank? or params[:student][:last_name].blank?
    #   flash[:notice] = "Please fill out all fields"
    #   redirect_to new_student_registration_path and return
    # end
    # if !(params[:first_name].blank? or params[:last_name].blank? or params[:email].blank? or params[:password].blank? or params[:password_confirmation].blank? or params[:password].length<6 or params[:password_confirmation].length<6 or params[:password]!=params[:password_confirmation])
      student=Student.where(email:params[:student][:email]).take
     puts "-----------------------------------asdasdasdasfsddfgdfwsadfsfdgdf"
    puts params
      student_profile={:student_id=>student.id,:gpa=>nil,:gre=>nil, :toefl => nil,
                       :interested_major => nil, :term => nil,
                       :year =>nil }

      Profile.create!(student_profile)

      student_email = params[:student][:email]
      EmailStudentsMailer.create_account(student_email).deliver_now
    # end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    flash[:notice] = "Account Updated"
  end

  # DELETE /resource
  def destroy
    super
    reset_session
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
       devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])

  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
