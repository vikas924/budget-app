class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { home? || Rails.env.test? }
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def home?
    controller_name == 'users' && action_name == 'index'
  end
end
