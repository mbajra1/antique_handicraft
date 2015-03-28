json.array!(@products) do |product|
  json.extract! product, :id, :product_id, :seller_id, :product_name, :image_url, :category, :sub_category, :product_condition, :description, :technical_description, :price, :quantity
  json.url product_url(product, format: :json)
end
