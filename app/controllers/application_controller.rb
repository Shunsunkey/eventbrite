# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery with: :exception
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :age, :description])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :age, :description])
    end
  end
  