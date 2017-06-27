require 'rails_helper'

describe "Orders API" do
  it "sends a list of orders" do
    create_list(:order, 3)

    get '/api/v1/orders'

    expect(response).to be_success

    orders = JSON.parse(response.body)
    order = orders.first

    expect(orders.count).to eq(3)
    expect(order).to have_key("order_number")
    expect(order["order_number"]).to be_a String
  end
  context "GET /orders/:id" do
    it "can get one order by its id" do
      id = create(:order).id

      get "/api/v1/orders/#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item["id"]).to eq(id)
      expect(item).to have_key("order_number")
      expect(item["order_number"]).to be_a String
    end
  end
end
