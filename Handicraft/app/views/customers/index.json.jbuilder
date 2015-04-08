json.array!(@customers) do |customer|
  json.extract! customer, :id, :customer_id, :company, :last_name, :first_name, :email, :business_phone, :home_phone, :cell_phone, :fax, :address, :city, :state_province, :zip_postal_code, :country_region
  json.url customer_url(customer, format: :json)
end
