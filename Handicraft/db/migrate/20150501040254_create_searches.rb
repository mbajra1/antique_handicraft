class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :category_id
      t.float :minimum_price
      t.float :maximum_price

      t.timestamps null: false
    end
  end
end
