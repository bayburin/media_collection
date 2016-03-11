class RenameCollectionItemsToItems < ActiveRecord::Migration
  def change
    rename_table :collection_items, :items
  end
end
