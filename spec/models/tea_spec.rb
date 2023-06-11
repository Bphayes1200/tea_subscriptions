require "rails_helper"

RSpec.describe Tea do 
  describe "relationships" do 
    it { should have_many :customer_teas }
  end
end