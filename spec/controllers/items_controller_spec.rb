require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  before(:each) do
    @user         = create(:user)
    @collection   = create(:collection, user_id: @user.id)
    sign_in :user, @user
  end

  describe "#new" do
    it "renders new page with form to create item" do
      get :new, collection_id: @collection.id
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    it "redirects to user collection path after create item" do
      post :create, collection_id: @collection.id, item: { description: "Тестовое описание", link: "http://test_url.ru" }
      expect(response).to redirect_to(collections_path)
    end

    it "renders new page with form after failure create item" do
      post :create, collection_id: @collection.id, item: { link: "http://test_url.ru" }
      expect(response).to render_template(:new)
    end
  end

  describe "#edit" do
    it "renders edit page with form to edit item" do
      item = create(:item, collection_id: @collection.id)
      get :edit, collection_id: @collection.id, id: item.id
      expect(response).to render_template(:edit)
    end

    it "render 404 page if item not found" do
      get :edit, collection_id: @collection.id, id: 0
      expect(response.status).to eq 404
    end
  end

  describe "#update" do
    it "redirects to user collection path after update item" do
      item = create(:item, collection_id: @collection.id)
      put :update, collection_id: @collection.id, id: item.id, item: { description: "Новое тестовое описание", link: "http://new_test_url.ru" }
      expect(response).to redirect_to(collections_path)
    end

    it "renders new page with form after failure update item" do
      item = create(:item, collection_id: @collection.id)
      put :update, collection_id: @collection.id, id: item.id, item: { description: "", link: "http://new_test_url.ru" }
      expect(response).to render_template(:edit)
    end
  end

  describe "#destroy" do
    it "redirects to user collection path after destroy item" do
      item = create(:item, collection_id: @collection.id)
      delete :destroy, collection_id: @collection.id, id: item.id
      expect(response).to redirect_to(collections_path)
    end
  end

end
