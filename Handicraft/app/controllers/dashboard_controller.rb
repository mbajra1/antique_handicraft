class DashboardController < ApplicationController
  def index
    if current_user
      @customer = Customer.where("email=?",current_user.email)
      @seller = Seller.where("email=?",current_user.email)
      @product = Product.where("u_id=?",current_user.id)
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

    #For all bidding history
    @bid_history=BidAction.where('bidder_id=?',customer_id+'***').limit(2)
    @bid_history=@bid_history.select(:bid_cart_id).distinct

    #For bid winnings history
    @bids_won=BidWinner.where(winner_id: customer_id).limit(2)

    #For bid loss history
    @bid_actions_history=BidAction.where(bidder_id: customer_id+'***').limit(2)
    @bid_actions_history=@bid_actions_history.select(:bid_cart_id).distinct

    #For purchase history
    @purchase_history=Order.where(customer_id: customer_id).limit(1)


  end
end
