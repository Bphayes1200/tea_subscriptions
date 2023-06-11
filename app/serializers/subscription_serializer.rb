class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :active, :tea_id
end
