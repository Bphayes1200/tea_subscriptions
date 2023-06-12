require "rails_helper"

RSpec.describe "All subscriptions request" do 
  before :each do 
    @customer = create(:customer)
    @tea = create(:tea)
    @subscription_1 = create(:subscription, active: true, customer_id: @customer.id, tea_id: @tea.id)
    @subscription_2 = create(:subscription, active: false, customer_id: @customer.id, tea_id: @tea.id)
  end

  it "will return a list of all of a customers subscriptions, active or not" do 
    get "/api/v1/customers/#{@customer.id}/subscriptions"

    expect(response.status).to eq(200)

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:data].first[:attributes][:active]).to eq(true)
    expect(subscriptions[:data].second[:attributes][:active]).to eq(false)
  end

  it "will return an error if customer does not exist" do 
    get "/api/v1/customers/1/subscriptions"

    expect(response.status).to eq(404)

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:errors]).to eq("Couldn't find Customer with 'id'=1")
  end 
end