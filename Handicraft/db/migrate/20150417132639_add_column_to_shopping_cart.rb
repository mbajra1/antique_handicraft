class AddColumnToShoppingCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :invoice_id , :string
  end
end
