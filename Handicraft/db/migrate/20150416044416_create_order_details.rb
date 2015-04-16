class CreateOrderDetails < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :order_detail_id
      t.string :order_id
      t.string :product_id
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :discount
      t.string :tax_status
      t.string :order_detail_status

      t.timestamps null: false
    end
  end
end
