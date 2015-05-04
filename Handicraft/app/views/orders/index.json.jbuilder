json.array!(@orders) do |order|
  json.extract! order, :id, :order_id, :customer_id, :shipping_id, :order_status, :order_date, :shopping_cart_id
  json.url order_url(order, format: :json)
end
