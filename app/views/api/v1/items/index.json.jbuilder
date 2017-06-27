json.(@items) do |item|
  json.(item, :id, :name, :description)
  json.num_orders(item.orders.count)
end
