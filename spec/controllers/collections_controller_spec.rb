require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do

  let(:user) { create(:user) }
  let(:collection) { create(:collection, user: user) }

  before { sign_in user }

  describe '#index' do
    subject { get :index }
    before { subject }

    context 'when count of items is not equal to 0' do
      let(:item) { create(:item, collection_id: collection.id) }

      it 'renders index page' do
        expect(response).to render_template(:index)
      end
    end

    context 'count of items is equal to 0' do
      it 'render your empty collection' do
        expect(response).to render_template(file: "#{Rails.root}/app/views/collections/empty_your_collection.haml")
      end
    end
  end

  describe '#show' do
    let(:collection) { create(:collection) }

    before { subject }

    context 'collection doens not exist' do
      subject { get :show, id: 0 }

      it 'renders 404 page' do
        expect(response.status).to eq 404
      end
    end

    context 'when collection exist' do
      let(:item) { create(:item, collection: collection.id) }
      subject { get :show, id: collection.id }

      it 'renders show page' do
        expect(response).to render_template(:show)
      end
    end

    context 'when count of items is equal 0' do
      subject { get :show, id: collection.id }

      it 'renders empty collection' do
        expect(response).to render_template(file: "#{Rails.root}/app/views/collections/empty_user_collection.haml")
      end
    end
  end

end
