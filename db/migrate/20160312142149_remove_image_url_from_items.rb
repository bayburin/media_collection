class RemoveImageUrlFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :image_url, :string
  end
end
