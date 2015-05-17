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
  
  #required field for security
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:username, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) << :username
  end
  
  # for custom layput for devise login
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "custom"
    else
      "application"
    end
  end

  private

  # for Cart
  def current_cart

    @user_cart=ShoppingCart.where(u_id: current_user.id)

    if @user_cart
      ShoppingCart.find(session[:cart_id])
    end
    rescue ActiveRecord::RecordNotFound
    cart =  ShoppingCart.create
    session[:cart_id] = cart.id
    cart.update_attribute(:u_id, current_user.id)
    session[:shipping_book_id]=nil
    session[:discount]=nil
    cart
  end


end
