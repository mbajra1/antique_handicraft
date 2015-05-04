class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }

  layout :layout_by_resource

  # Cancan sanitizer
  before_action :configure_permitted_parameters, if: :devise_controller?

  # In your controllers
  # before_action :authenticate_user!, :except => [:index, :show]


  # Cancan Exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:username, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) << :username
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "custom"
    else
      "application"
    end
  end
end
