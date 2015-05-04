json.array!(@bid_carts) do |bid_cart|
  json.extract! bid_cart, :id, :bid_product_id, :bid_end_date, :opening_price
  json.url bid_cart_url(bid_cart, format: :json)
end
