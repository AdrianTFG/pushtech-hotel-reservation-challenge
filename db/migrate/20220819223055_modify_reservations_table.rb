class ModifyReservationsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :hotel_name
    remove_column :reservations, :price
    remove_column :reservations, :currency
    add_reference :reservations, :room, null: false, foreign_key: true
  end
end
