require "rails_helper"

RSpec.describe Customer, type: :model do 
  describe "relationships" do 
    it { should have_many :tea_subscriptions }
  end
end