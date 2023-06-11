FactoryBot.define do 
  factory :tea do 
    name { Faker::Name.name }
    cost { Faker::Number.digit }
  end
end