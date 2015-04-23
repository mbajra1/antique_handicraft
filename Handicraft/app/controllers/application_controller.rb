class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery unless: -> { request.format.json? }

  private


  def current_cart
    ShoppingCart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart =  ShoppingCart.create
    session[:cart_id] = cart.id
    session[:shipping_book_id]=nil
    session[:discount]=nil


    cart
  end


end
