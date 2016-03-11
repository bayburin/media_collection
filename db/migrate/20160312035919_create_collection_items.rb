class CreateCollectionItems < ActiveRecord::Migration
  def change
    create_table :collection_items do |t|
      t.references  :collection
      t.text        :description
      t.string      :image_url
      t.string      :link
    end
  end
end
