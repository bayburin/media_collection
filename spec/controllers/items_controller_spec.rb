require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:user) { create(:user) }
  before { sign_in :user, user }

  describe "#new" do
    before { subject }

    context "when variable is created" do
      subject { get :new }
      it "renders new page" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#create" do
    before { subject }

    context "when item was created" do
      let!(:item) { attributes_for(:item) }
      subject { post :create, item: item }
      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when item was not created" do
      let!(:invalid_item) { attributes_for(:invalid_item) }
      subject { post :create, item: invalid_item }
      it "renders to new page again" do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "#edit" do
    before { subject }

    context "when variable is created" do
      let(:item) { create(:item, user_id: user.id) }
      subject { get :edit, id: item.id }
      it "renders edit page" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#update" do
    before { subject }
    let!(:item_old) { create(:item, user_id: user.id) }

    context "when item was updated" do
      let!(:item_new) { attributes_for(:item) }
      subject { put :update, id: item_old.id, item: item_new }
      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end

    context "when item was not updated" do
      let!(:invalid_item) { attributes_for(:invalid_item) }
      subject { put :update, id: item_old, item: invalid_item}
      it "renders to new page again" do
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "#destroy" do
    before { subject }

    context "when item was(or not was) destroyed" do
      let(:item) { create(:item, user_id: user.id) }
      subject { delete :destroy, id: item.id }
      it "redirect to root_path" do
        expect(response).to redirect_to(root_path)
      end
    end
  end

end
