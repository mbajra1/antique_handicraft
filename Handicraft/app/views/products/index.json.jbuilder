json.array!(@products) do |product|
  json.extract! product, :id, :product_id, :name, :image_url, :category, :subcategory, :product_condition, :description, :technical_description, :price, :quantity
  json.url product_url(product, format: :json)
end
