class DashboardController < ApplicationController
  def index
    if current_user
      @customer = Customer.where("email=?",current_user.email)
      @seller = Seller.where("email=?",current_user.email)
      @product = Product.where("u_id=?",current_user.id)
    end

    # For browsing history
    if current_user
      @history = History.where("customer_id=?", current_user.id).limit(3)
    end
  end
end
