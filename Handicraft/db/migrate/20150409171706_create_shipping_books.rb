class CreateShippingBooks < ActiveRecord::Migration
  def change
    create_table :shipping_books do |t|
      t.string :shipping_book_id
      t.string :customer_id
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_state_province
      t.string :shipping_zip_postal
      t.string :shipping_country_region

      t.timestamps null: false
    end
  end
end
