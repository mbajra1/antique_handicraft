class DashboardController < ApplicationController
  def index
    @customer = Customer.where("email=?",current_user.email)
    @seller = Seller.where("email=?",current_user.email)

    # For browsing history
    if current_user
      @history = History.where("customer_id=?", current_user.id).limit(3)
    else
      put "You dont have a history"
    end
  end
end
