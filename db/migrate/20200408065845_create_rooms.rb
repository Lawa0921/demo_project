class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :price
      t.integer :people
      t.integer :amount

      t.timestamps
    end
  end
end
