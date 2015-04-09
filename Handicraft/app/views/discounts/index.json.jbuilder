json.array!(@discounts) do |discount|
  json.extract! discount, :id, :discount_code, :discount_amount
  json.url discount_url(discount, format: :json)
end
