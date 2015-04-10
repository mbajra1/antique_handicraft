json.array!(@order_shipments) do |order_shipment|
  json.extract! order_shipment, :id, :shipment_id, :order_id, :customer_id, :shipper_name, :shipping_type, :shipping_name, :shipping_address, :shipping_city, :shipping_state_province
  json.url order_shipment_url(order_shipment, format: :json)
end
