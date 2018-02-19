class CreateTrees < ActiveRecord::Migration[5.1]
  def change
    create_table :trees do |t|
      t.string :location
      t.integer :price
      t.string :photo
      t.integer :price_per_night
      t.boolean :available
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
