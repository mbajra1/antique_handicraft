class CreateBidActions < ActiveRecord::Migration
  def change
    create_table :bid_actions do |t|
      t.string :bidder_id
      t.decimal :bid_amount
      t.references :bid_cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :bid_actions, :bid_carts
  end
end
