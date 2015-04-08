class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :seller_id
      t.string :company
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :business_phone
      t.string :home_phone
      t.string :cell_phone
      t.string :fax
      t.string :address
      t.string :city
      t.string :state_province
      t.string :zip_postal_code
      t.string :country_region

      t.timestamps null: false
    end
  end
end
