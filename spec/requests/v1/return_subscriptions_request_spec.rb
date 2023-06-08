require "rails_helper"

RSpec.describe "All subscriptions request" do 
  before :each do 
    @customer = create(:customer, id: 1)
    @subscription_1 = create(:tea_subscription, active: true, customer_id: @customer.id)
    @subscription_12 = create(:tea_subscription, active: false, customer_id: @customer.id)
  end
  it "will return a list of all of a customers subscriptions, active or not" do 
    get "/api/v1/customers/#{@customer.id}/tea_subscriptions"

    expect(response.status).to eq(200)

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:data].first[:attributes][:active]).to eq(true)
    expect(subscriptions[:data].second[:attributes][:active]).to eq(false)
  end
end