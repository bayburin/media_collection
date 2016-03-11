class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references  :user
      t.text        :description
      t.string      :image_url
      t.string      :link
    end
  end
end
