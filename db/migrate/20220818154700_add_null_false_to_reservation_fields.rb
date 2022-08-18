class AddNullFalseToReservationFields < ActiveRecord::Migration[7.0]
  def change
    change_column_null :reservations, :hotel_name, false
    change_column_null :reservations, :price, false
    change_column_null :reservations, :currency, false
    change_column_null :reservations, :entry_date, false
    change_column_null :reservations, :departure_date, false
    change_column_null :reservations, :customer_name, false
    change_column_null :reservations, :customer_email, false
  end
end
