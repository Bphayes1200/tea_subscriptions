require "rails_helper"

RSpec.describe "All subscriptions request" do 
  before :each do 
    @customer = create(:customer, id: 1)
    @tea = create(:tea)
    @subscription_1 = create(:subscription, active: true, customer_id: @customer.id, tea_id: @tea.id)
    @subscription_2 = create(:subscription, active: false, customer_id: @customer.id, tea_id: @tea.id)
  end
  it "will return a list of all of a customers subscriptions, active or not" do 
    get "/api/v1/customers/#{@customer.id}/tea_subscriptions"

    expect(response.status).to eq(200)

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:data].first[:attributes][:active]).to eq(true)
    expect(subscriptions[:data].second[:attributes][:active]).to eq(false)
  end
end