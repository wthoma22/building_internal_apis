class ItemSerializer < ActiveModel::Serializer
  attributes :id, :num_items

  def num_items
  object.orders.count
  end

end
