require "rails_helper" 

RSpec.describe TeaSubscription, type: :model do 
  describe "relationships" do 
    it { should belong_to :customer }
  end
end