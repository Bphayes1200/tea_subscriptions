# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
@customer = Customer.create!(first_name: "John", last_name: "Doe", email: "example@example.com")
@customer2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "example@example.com")
@tea1 = Tea.create!(name: "Tea1", cost: 1)
@tea2 = Tea.create!(name: "Tea2", cost: 2)
@subscription_1 = Subscription.create!(price: 10.50, active: true, customer_id: @customer.id, tea_id: @tea1.id)
@subscription_2 = Subscription.create!(price: 10.50, active: false, customer_id: @customer.id, tea_id: @tea1.id)
@subscription_2 = Subscription.create!(price: 10.50, active: true, customer_id: @customer2.id, tea_id: @tea2.id)
@subscription_2 = Subscription.create!(price: 10.50, active: false, customer_id: @customer2.id, tea_id: @tea2.id)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
