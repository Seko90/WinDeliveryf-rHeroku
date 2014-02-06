json.array!(@customers) do |customer|
  json.extract! customer, :id, :TNummer, :Vname, :Nname, :Straße, :HNummer, :plz, :erstellt
  json.url customer_url(customer, format: :json)
end
