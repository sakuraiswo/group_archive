class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname profile])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
         username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def skip_authentication
    devise_controller? && (action_name == 'new' || action_name == 'create' || action_name == 'sign_in')
  end
end
