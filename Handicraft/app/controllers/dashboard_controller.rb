class DashboardController < ApplicationController
  def index
    if current_user
      @customer = Customer.where("email=?",current_user.email)
      @seller = Seller.where("email=?",current_user.email)
    end

    # For browsing history

    customer_id=''
    if current_user
      email=current_user.email
      @customer=Customer.where(email: email)
      @customer.each do |customer|
        customer_id=customer.customer_id
      end
    end
    @history = History.where("customer_id=?", customer_id).limit(3)

    #For shipping tab
    @shipping_book=ShippingBook.where("customer_id=?", customer_id).limit(1)

    #For current bid
    @current_auction=BidCart.all.limit(2)

    #For bidding history
    @bid_history=BidAction.where('bidder_id=?',customer_id).limit(1)

  end
end
