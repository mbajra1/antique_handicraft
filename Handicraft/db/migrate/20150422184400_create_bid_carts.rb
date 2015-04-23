class CreateBidCarts < ActiveRecord::Migration
  def change
    create_table :bid_carts do |t|
      t.string :bid_product_id
      t.datetime :bid_end_date
      t.decimal :opening_price

      t.timestamps null: false
    end
  end
end
