json.array!(@products) do |product|
  json.extract! product, :id, :product_id, :name, :description, :image_url, :category, :subcategory, :product_condition, :price
  json.url product_url(product, format: :json)
end
