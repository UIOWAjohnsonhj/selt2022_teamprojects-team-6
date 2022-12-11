# frozen_string_literal: true

class FacultyMembers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :require_no_authentication, only: [:new, :create]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    faculty = FacultyMember.where(email:params[:faculty_member][:email]).take
    faculty.university = current_faculty_member.university
    faculty.department_id = current_faculty_member.department_id
    faculty.save
    session[:new_account]=true
  end

  # GET /resource/edit
  # def edit
  #   super
  # endstill-waters

  # PUT /resource
  def update
    super
    flash[:notice] = "Account Updated"
  end

  # DELETE /resource
  def destroy
    super
    flash[:notice] = "Account Deleted"
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
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:university])
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:department_id])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:focus_area])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:research_url])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:chair])


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
