json.array!(@cart_items) do |cart_item|
  json.extract! cart_item, :id, :shopping_cart_id, :product_id, :seller_id, :price, :quantity
  json.url cart_item_url(cart_item, format: :json)
end
