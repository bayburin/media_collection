require 'rails_helper'

RSpec.describe Item, type: :model do

  context "when description parameter is valid" do
    let(:item) { create(:item) }
    it "return true" do
      expect(item.valid?).to be true
    end
  end

end
