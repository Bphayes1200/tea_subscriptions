require "rails_helper"

RSpec.describe "create new subscription request" do 
  before :each do 
    @customer = create(:customer, id: 1)
    @tea = create(:tea)
  end 
  it "will create a new subscription" do 
    expect(@customer.subscriptions).to eq([])

    headers = {"CONTENT_TYPE" => "application/json"}

    subscription_params = {
      price: 10.5,
      active: true,
      customer_id: @customer.id,
      tea_id: @tea.id
    }

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate({subscription: subscription_params})

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(Customer.find(@customer.id).subscriptions.first.customer_id).to eq(@customer.id)
    expect(Customer.find(@customer.id).subscriptions.first.tea_id).to eq(@tea.id)
    expect(subscriptions[:data][:attributes][:active]).to eq(true)
  end

  it "will return an error if the customer_id is invalid" do 
    headers = {"CONTENT_TYPE" => "application/json"}

    subscription_params = {
      price: 10.5,
      active: true,
      customer_id: 0,
      tea_id: @tea.id
    }

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate({subscription: subscription_params})

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:errors]).to eq("Validation failed: Customer must exist")
  end

  it "will return an error if price is not an integer" do 
    headers = {"CONTENT_TYPE" => "application/json"}

    subscription_params = {
      price: "10",
      active: true,
      customer_id: 0,
      tea_id: @tea.id
    }

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate({subscription: subscription_params})

    subscriptions = JSON.parse(response.body, symbolize_names: true)
 
    expect(subscriptions[:errors]).to eq("Validation failed: Customer must exist")
  end
end