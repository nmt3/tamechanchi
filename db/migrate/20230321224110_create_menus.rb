class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|

      t.string :name, null: false
      t.integer :price, null: false
      t.integer :genre_id


      t.timestamps
    end
  end
end
