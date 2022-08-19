class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.text :description
      t.float :price
      t.string :currency

      t.timestamps
    end
  end
end
