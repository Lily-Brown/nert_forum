class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to root_url
  end

end
