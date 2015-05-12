class BidHistoryController < ApplicationController
  def index

    customer_id=''
    if current_user
      email=current_user.email
      @customer=Customer.where(email: email)
      @customer.each do |customer|
        customer_id=customer.customer_id
      end

    end


    @bids_won=BidWinner.where(winner_id: customer_id)

    @bid_actions_history=BidAction.where(bidder_id: customer_id+'***')

    @bid_actions_history=@bid_actions_history.select(:bid_cart_id).distinct

=begin
    @bid_actions_history_grouped=BidAction.where(bidder_id: customer_id).group_by{|bid_action|[bid_action.bidder_id, bid_action.bid_cart_id]}


    @bid_actions_history_grouped.values.each do |duplicates|
      first_one=duplicates.shift
      duplicates.each{|double| double.destroy}
    end
=end



  end
end
