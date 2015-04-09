class CreateStateTaxes < ActiveRecord::Migration
  def change
    create_table :state_taxes do |t|
      t.string :state_code
      t.float :tax_rate

      t.timestamps null: false
    end
  end
end
