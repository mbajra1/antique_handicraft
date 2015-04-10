class CreateOrderShipments < ActiveRecord::Migration
  def change
    create_table :order_shipments do |t|
      t.string :shipment_id
      t.string :order_id
      t.string :customer_id
      t.string :shipper_name
      t.string :shipping_type
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_city
      t.string :shipping_state_province

      t.timestamps null: false
    end
  end
end
