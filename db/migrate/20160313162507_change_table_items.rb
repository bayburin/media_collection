class ChangeTableItems < ActiveRecord::Migration
  change_table :items do |t|
    t.rename :collection_id, :user_id
    t.index :user_id
  end
end
