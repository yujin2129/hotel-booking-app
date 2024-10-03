class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.integer :cost
      t.string :address
      t.string :img
      t.integer :user_id

      t.timestamps
    end
  end
end
