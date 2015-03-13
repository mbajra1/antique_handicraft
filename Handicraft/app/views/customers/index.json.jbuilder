json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_id, :password, :customer_name, :customer_lastname, :address, :email_address, :seller_id
  json.url customer_url(customer, format: :json)
end
