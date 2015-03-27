json.array!(@histories) do |history|
  json.extract! history, :id, :customer_id, :product_id, :product_name, :image_url, :price, :date_visited
  json.url history_url(history, format: :json)
end
