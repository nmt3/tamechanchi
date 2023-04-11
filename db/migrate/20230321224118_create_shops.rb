class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :telephone
      t.string :address
      t.string :post_code
      t.string :business_time
      t.string :holiday


      t.timestamps
    end
  end
end
