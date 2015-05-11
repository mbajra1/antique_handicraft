class CreateBidWinners < ActiveRecord::Migration
  def change
    create_table :bid_winners do |t|
      t.string :winner_id
      t.string :bid_product
      t.decimal :winning_amount
      t.references :bid_cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :bid_winners, :bid_carts
  end
end
