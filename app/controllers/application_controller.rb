class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:subdomain) }
  end

  def  after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      products_url(:host => current_user.subdomain + '.' + request.domain + request.port_string)
    end
  end

  def  after_sign_up_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      products_url(subdomain: current_user.subdomain + '.' + request.domain + request.port_string)
    end
  end

  def  after_sign_out_path_for(resource_or_scope)
    root_url(subdomain: false)
  end

end