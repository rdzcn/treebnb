class AddDescriptionToTrees < ActiveRecord::Migration[5.1]
  def change
    add_column :trees, :description, :text
    remove_column :trees, :price
  end
end
