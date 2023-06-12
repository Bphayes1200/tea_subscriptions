class Tea < ApplicationRecord
  has_many :subscriptions
  validates_presence_of :name, :cost
end