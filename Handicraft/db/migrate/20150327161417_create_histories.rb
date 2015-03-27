class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :customer_id
      t.string :product_id
      t.string :product_name
      t.string :image_url
      t.decimal :price
      t.datetime :date_visited

      t.timestamps null: false
    end
  end
end
