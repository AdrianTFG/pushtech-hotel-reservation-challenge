class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :hotel_name
      t.float :price
      t.string :currency
      t.datetime :entry_date
      t.datetime :departure_date
      t.string :customer_name
      t.string :customer_email

      t.timestamps
    end
  end
end
