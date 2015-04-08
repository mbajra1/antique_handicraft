json.array!(@sellers) do |seller|
  json.extract! seller, :id, :seller_id, :company, :last_name, :first_name, :email, :business_phone, :home_phone, :cell_phone, :fax, :address, :city, :state_province, :zip_postal_code, :country_region
  json.url seller_url(seller, format: :json)
end
