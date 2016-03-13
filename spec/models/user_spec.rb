require 'rails_helper'

RSpec.describe User, type: :model do

  context "when username parameter is valid" do
    let(:user) { create(:user) }
    it "return true" do
      expect(user.valid?).to be true
    end
  end

end
