class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone_number, :string
    add_column :users, :photo, :string
  end
end
