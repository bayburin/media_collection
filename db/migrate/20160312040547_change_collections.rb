class ChangeCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :description, :text
    remove_column :collections, :image_url, :string
    remove_column :collections, :link, :string
  end
end
