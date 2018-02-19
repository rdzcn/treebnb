class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date_check_in
      t.date :date_check_out
      t.integer :total_price
      t.references :user, foreign_key: true
      t.references :tree, foreign_key: true

      t.timestamps
    end
  end
end
