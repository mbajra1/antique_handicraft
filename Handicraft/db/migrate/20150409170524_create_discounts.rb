class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :discount_code
      t.float :discount_amount

      t.timestamps null: false
    end
  end
end
