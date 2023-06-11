class Api::V1::TeaSubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(customer.subscriptions)
  end

  def update
    subscription = TeaSubscription.find(params[:id])
    subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(subscription)
  end

private
  def subscription_params
    params.require(:tea_subscription).permit(:active)
  end
end