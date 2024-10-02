class AddImgcacheToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :img_cache, :string
  end
end
