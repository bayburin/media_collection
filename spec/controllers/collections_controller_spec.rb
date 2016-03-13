require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe "#index" do
    before { subject }
    subject { get :index }

    context "count of items is equal to 0" do
      it "render your empty collection" do
        expect(response).to render_template(file: "#{Rails.root}/app/views/collections/empty_your_collection.haml")
      end
    end
  end

end
