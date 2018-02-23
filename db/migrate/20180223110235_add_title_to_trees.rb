class AddTitleToTrees < ActiveRecord::Migration[5.1]
  def change
    add_column :trees, :title, :string
  end
end
