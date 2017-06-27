json.(@order, :id, :order_number)
json.items (@order.items.count)
json.items @order.items do |item|
  json.(item, :id)
end
