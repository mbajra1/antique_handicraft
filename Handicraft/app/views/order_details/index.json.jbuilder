json.array!(@order_details) do |order_detail|
  json.extract! order_detail, :id, :order_detail_id, :order_id, :product_id, :quantity, :unit_price, :discount, :tax_status, :order_detail_status
  json.url order_detail_url(order_detail, format: :json)
end
