class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  has_many :subscriptions
end