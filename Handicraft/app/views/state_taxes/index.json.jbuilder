json.array!(@state_taxes) do |state_tax|
  json.extract! state_tax, :id, :state_code, :tax_rate
  json.url state_tax_url(state_tax, format: :json)
end
