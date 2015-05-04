class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :shopping_cart_id
      t.string :product_id
      t.string :seller_id
      t.decimal :price
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
