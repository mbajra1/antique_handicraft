class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :customer_id
      t.string :password
      t.string :customer_firstname
      t.string :customer_lastname
      t.string :address
      t.string :email_address
      t.string :seller_id

      t.timestamps null: false
    end
  end
end
