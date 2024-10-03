class AddImgcacheToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img_cache, :string
  end
end
