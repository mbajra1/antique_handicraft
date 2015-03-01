class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :name
      t.text :description
      t.string :image_url
      t.string :category
      t.string :subcategory
      t.string :product_condition
      t.decimal :price, precision:8, scale:2

      t.timestamps null: false
    end
  end
end
