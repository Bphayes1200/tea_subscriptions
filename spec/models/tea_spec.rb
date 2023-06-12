require "rails_helper"

RSpec.describe Tea do 
  describe "relationships" do 
    it { should have_many :subscriptions }
  end

  describe "validations" do 
    it { should validate_presence_of :name }
    it { should validate_presence_of :cost }
  end 
end