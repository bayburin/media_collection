require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in user }

  describe "#show" do
    before { subject }

    context "when user was found" do
      context "when collection is empty" do
        subject { get :show, username: user.username }
        it "renders empty collection" do
          expect(response).to render_template(file: "#{Rails.root}/app/views/collections/empty_user_collection.haml")
        end
      end
    end

    context "when user was not found" do
      subject { get :show, username: "non-exist" }
      it "render 404 page" do
        expect(response.status).to eq 404
      end
    end
  end

end
