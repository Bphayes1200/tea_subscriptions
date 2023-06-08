require "rails_helper" 

RSpec.describe "Update subscription status" do 
  before :each do 
    @customer = create(:customer, id: 1)
    @subscription_1 = create(:tea_subscription, active: true, customer_id: @customer.id)
    @subscription_2 = create(:tea_subscription, active: false, customer_id: @customer.id)
  end

  it "will update a subscriptions active status to true" do 
    expect(@subscription_2.active).to eq(false)
    headers = {"CONTENT_TYPE" => "application/json"}
    subscription_params = {active: true}

    patch "/api/v1/tea_subscriptions/#{@subscription_2.id}", headers: headers, params: JSON.generate({tea_subscription: subscription_params})
    
    subscription = TeaSubscription.find(@subscription_2.id)

    expect(subscription.active).to eq(true)
  end

  it "will cancel a subscription/update active status to false" do 
    expect(@subscription_1.active).to eq(true)
    headers = {"CONTENT_TYPE" => "application/json"}
    subscription_params = {active: false}

    patch "/api/v1/tea_subscriptions/#{@subscription_1.id}", headers: headers, params: JSON.generate({tea_subscription: subscription_params})
    
    subscription = TeaSubscription.find(@subscription_1.id)

    expect(subscription.active).to eq(false)
  end
end