FactoryBot.define do 
  factory :subscription do 
    active { false }
    price { 10.50 }
    customer_id { 1 }
    tea_id { 1 }
  end
end