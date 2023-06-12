class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :active, :tea_id, :customer_id
end
