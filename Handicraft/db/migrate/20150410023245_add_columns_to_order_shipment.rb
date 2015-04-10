class AddColumnsToOrderShipment < ActiveRecord::Migration
  def change
    change_table(:order_shipments) do |t|
      t.column :shipping_zip_postal, :string
      t.column :shipping_country_region, :string
      t.column :shipping_cost, :decimal
      t.column :shipped_date, :datetime
    end

  end
end
