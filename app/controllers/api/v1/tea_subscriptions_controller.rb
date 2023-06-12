class Api::V1::TeaSubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def update
    subscription = Subscription.find(params[:id])
    subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(subscription)
  end

  def create 
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription)
    else 
      "error"
    end
  end
private
  def subscription_params
    params.require(:subscription).permit(:active, :price, :customer_id, :tea_id)
  end
end