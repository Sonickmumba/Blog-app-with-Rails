class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referrer
    '/users/sign_in'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :bio, :photo, :password, :posts_counter, :role)
    end

    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end
  end
end
