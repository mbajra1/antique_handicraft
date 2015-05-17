class AddUserToCart < ActiveRecord::Migration
  def change
    add_column :shopping_carts, :u_id, :integer
  end
end
