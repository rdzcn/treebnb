class AddAddressToTrees < ActiveRecord::Migration[5.1]
  def change
    add_column :trees, :address, :string
  end
end
