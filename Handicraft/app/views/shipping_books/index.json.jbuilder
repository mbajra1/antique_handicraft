json.array!(@shipping_books) do |shipping_book|
  json.extract! shipping_book, :id, :shipping_book_id, :customer_id, :shipping_name, :shipping_address, :shipping_city, :shipping_state_province, :shipping_zip_postal, :shipping_country_region
  json.url shipping_book_url(shipping_book, format: :json)
end
