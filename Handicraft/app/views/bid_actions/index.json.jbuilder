json.array!(@bid_actions) do |bid_action|
  json.extract! bid_action, :id, :bidder_id, :bid_amount, :bid_cart_id
  json.url bid_action_url(bid_action, format: :json)
end
