json.array!(@bid_winners) do |bid_winner|
  json.extract! bid_winner, :id, :winner_id, :bid_product, :winning_amount, :bid_cart_id
  json.url bid_winner_url(bid_winner, format: :json)
end
