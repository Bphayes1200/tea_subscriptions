require "rails_helper" 

RSpec.describe "Update subscription status" do 
  before :each do 
    @customer = create(:customer, id: 1)
    @tea = create(:tea)
    @subscription_1 = create(:subscription, active: true, customer_id: @customer.id, tea_id: @tea.id)
    @subscription_2 = create(:subscription, active: false, customer_id: @customer.id, tea_id: @tea.id)
  end

  it "will update a subscriptions active status to true" do 
    expect(@subscription_2.active).to eq(false)
    headers = {"CONTENT_TYPE" => "application/json"}
    subscription_params = {active: true}

    patch "/api/v1/subscriptions/#{@subscription_2.id}", headers: headers, params: JSON.generate({subscription: subscription_params})
    
    subscription = Subscription.find(@subscription_2.id)

    expect(subscription.active).to eq(true)
  end

  it "will cancel a subscription/update active status to false" do 
    expect(@subscription_1.active).to eq(true)
    headers = {"CONTENT_TYPE" => "application/json"}
    subscription_params = {active: false}

    patch "/api/v1/subscriptions/#{@subscription_1.id}", headers: headers, params: JSON.generate({subscription: subscription_params})
    
    subscription = Subscription.find(@subscription_1.id)

    expect(subscription.active).to eq(false)
  end

  it "will return an error if subscription is not found" do 
    headers = {"CONTENT_TYPE" => "application/json"}
    subscription_params = {active: false}

    patch "/api/v1/subscriptions/1", headers: headers, params: JSON.generate({subscription: subscription_params})
    
    subscriptions = JSON.parse(response.body, symbolize_names: true)
    
    expect(subscriptions[:errors]).to eq("Couldn't find Subscription with 'id'=1")
  end
end