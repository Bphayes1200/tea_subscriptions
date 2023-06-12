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

    post "/api/v1/tea_subscriptions", headers: headers, params: JSON.generate({subscription: subscription_params})

    expect(Customer.find(@customer.id).subscriptions.first.customer_id).to eq(@customer.id)
    expect(Customer.find(@customer.id).subscriptions.first.tea_id).to eq(@tea.id)

  end
end