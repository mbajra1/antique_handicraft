class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_id
      t.string :customer_id
      t.string :shipping_id
      t.string :order_status
      t.datetime :order_date
      t.integer :shopping_cart_id

      t.timestamps null: false
    end
  end
end
