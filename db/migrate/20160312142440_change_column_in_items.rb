class ChangeColumnInItems < ActiveRecord::Migration
  def change
      change_column :items, :link, :text
  end
end
